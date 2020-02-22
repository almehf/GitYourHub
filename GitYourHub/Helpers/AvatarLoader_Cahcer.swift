//
//  AvatarLoader_Cahcer.swift
//  GitYourHub
//
//  Created by Fahad Almehawas  on 2/20/20.
//  Copyright © 2020 Fahad Al. All rights reserved.
//

import UIKit

class AvatarLoader_Cahcer: UIImageView {
    
    let imageCache = NetworkService.shared.imageCache
    let imagePlaceholder = UIImage(named: "avatar-placeholder")!
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
  
 
    private func configureLayout() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = imagePlaceholder
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString: String) {
        
        let cacheKey = NSString(string: urlString)
        if let image = imageCache.object(forKey: cacheKey) {
            self.image = image
            return
        }
       
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, res, err) in
        
            if err != nil { return }
            guard let res = res as? HTTPURLResponse, res.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
   
            self?.imageCache.setObject(image, forKey: cacheKey)
    
            DispatchQueue.main.async {
                self?.image = image
            }
        }
        task.resume()
    }
    
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
}
