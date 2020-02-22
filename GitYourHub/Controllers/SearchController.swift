//
//  SearchController.swift
//  GitYourHub
//
//  Created by Fahad Almehawas  on 2/21/20.
//  Copyright © 2020 Fahad Al. All rights reserved.
//

import UIKit
import SDWebImage

class SearchController: UIViewController {
    
    
    @IBOutlet weak var searchTxtField: UITextField!
    @IBOutlet weak var resultCountLabel: UILabel!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    fileprivate let cellId = "cellId"
    var users = NSMutableArray()
    var hasMore = false
    var pageNumber = 1
    var isLoading = false
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let fromBottom = scrollView.contentSize.height - contentYoffset
        
        if fromBottom <= height && !isLoading && hasMore {
            print(" You've reached to the end of the collectionView")
            loadMoreUsers()
        }
    }
    
    func loadMoreUsers() {
        pageNumber+=1
        self.isLoading = true
        
        let url = URL(string: String(format: "https://api.github.com/search/users?q=%@&page=%i", searchTxtField.text!, pageNumber))!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            self.isLoading = false
            
            if let data = data, let dict = try?JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                DispatchQueue.main.async {
                    if dict["items"] != nil {
                        self.users.addObjects(from: (dict["items"] as! NSArray) as! [Any])
                        self.resultCollectionView.reloadData()
                    }
                }
            }
            
            if let response = response as? HTTPURLResponse, let link = response.allHeaderFields["Link"] as? String {
                DispatchQueue.main.async {
                    if link.contains("rel=\"next\"")
                    {
                        self.hasMore = true
                        self.resultCountLabel.text = "Scroll down to see more..."
                    }
                    else
                    {
                        self.hasMore = false
                        self.resultCountLabel.text = "All users loaded."
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    self.hasMore = false
                    self.resultCountLabel.text = "All users loaded."
                }
            }
            
            if error != nil {
                DispatchQueue.main.async {
                    self.pageNumber-=1
                    self.resultCountLabel.text = error?.localizedDescription
                }
            }
        }
        task.resume()
    }
    
    
    @IBAction func searchUsers(_ sender: Any) {
        
        let url = URL(string: String(format: "https://api.github.com/search/users?q=%@", searchTxtField.text!))
        if url != nil {
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                
                if let response = response as? HTTPURLResponse, let link = response.allHeaderFields["Link"] as? String {
                    DispatchQueue.main.async {
                        self.pageNumber = 1
                        if link.contains("rel=\"next\"") {
                            self.hasMore = true
                            self.resultCountLabel.text = "Scroll down..."
                        } else
                        {
                            self.hasMore = false
                            self.resultCountLabel.text = "All users loaded."
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.hasMore = false
                        self.resultCountLabel.text = "All users loaded"
                    }
                } 
                
                if let data = data, let dict = try?JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    DispatchQueue.main.async {
                        if dict["items"] != nil {
                            // user results
                            self.users = NSMutableArray(array: dict["items"] as! NSArray)
                            self.resultCollectionView.reloadData()
                        } else if dict["message"] != nil{
                            // search went wrong
                            self.resultCountLabel.text = String(format:"Error: %@", (dict["message"] as? String)!)
                        }
                        
                    }
                }
                
                if error != nil {
                    DispatchQueue.main.async {
                        self.users = NSMutableArray()
                        self.resultCollectionView.reloadData()
                        self.resultCountLabel.text = error?.localizedDescription
                    }
                }
            }
            task.resume()
        } else {
            self.resultCountLabel.text = "Error: Search not valid."
        }
    }
    
}



extension SearchController:  UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "Cell", for: indexPath)
        
        if let userImage = cell.viewWithTag(10) as? UIImageView, let obj = users.object(at: indexPath.row) as? [String: Any], let urlString = obj["avatar_url"] as? String {
            userImage.sd_setImage(with: URL(string: urlString))
            userImage.contentMode = .scaleAspectFit
            userImage.layer.cornerRadius = userImage.frame.size.width / 2
            userImage.clipsToBounds = true
            userImage.layer.borderWidth = 0.5
            userImage.layer.masksToBounds = true
            userImage.layer.borderColor = UIColor.blue.cgColor
            
        }
        
        if let accountLabel = cell.viewWithTag(20) as? UILabel, let userObject = users.object(at: indexPath.row) as? [String: Any], let accountString = userObject["login"] as? String {
            accountLabel.text = accountString
        }
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
}
