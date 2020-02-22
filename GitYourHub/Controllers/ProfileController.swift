//
//  ProfileController.swift
//  GitYourHub
//
//  Created by Fahad Almehawas  on 2/20/20.
//  Copyright © 2020 Fahad Al. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

    var username = "almehf"
    
    let fullnameLabel = UILabel(text: "myFullName", textColor: .black, font: UIFont.systemFont(ofSize: 22, weight: .semibold), numberOfLines: 1)
    let usernameLabel = UILabel(text: "username", textColor: .lightGray, font: UIFont.systemFont(ofSize: 20, weight: .regular), numberOfLines: 1)
    
    let bioTextlabel =  UILabel(text: "bioText", textColor: .black, font: UIFont.systemFont(ofSize: 20, weight: .regular), numberOfLines: 3)
    
    let puplicReposLabel = UILabel(text: "Public Repos", textColor: .black, font: UIFont.systemFont(ofSize: 15))
    let reposLabel = UILabel(text: "134", textColor: .black, font: UIFont.systemFont(ofSize: 15))
    
    let puplicGists = UILabel(text: "Public Gists", textColor: .black, font: UIFont.systemFont(ofSize: 15))
    let gistsLabel = UILabel(text: "750", textColor: .black, font: UIFont.systemFont(ofSize: 15))
    let profileImage = UIImageView()
    
    
    let symbolImageView = UIImageView()
    let titleLabel = TitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = TitleLabel(textAlignment: .center, fontSize: 14)
    
    let topContainer = CustomView()
    let midContainer = CustomView()
    let bottomContainer = CustomView()
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    var itemViews = [UIView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.9686, green: 0.9686, blue: 0.9686, alpha: 1.0)
        
        layoutUI()
        getUserInfo()
        setupNavItems()
        
    }
    
    fileprivate func setupNavItems() {
        navigationItem.title = "Profile"
    }

    func layoutUI() {
        let padding: CGFloat = 20
        let itemsHeight: CGFloat = 90
        
        itemViews = [headerView, itemViewOne, itemViewTwo]
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            itemView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: padding, paddingLeft: padding, paddingBottom: padding, paddingRight: padding, width: 0, height: 0)
        }
        
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 180)
        
        itemViewOne.anchor(top: headerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: itemsHeight)
        
        
        itemViewTwo.anchor(top: itemViewOne.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: itemsHeight)
        
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    func getUserInfo() {
        NetworkService.shared.LoadingUserInfo(forUsername: username) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childVC: ProfileHeaderController(user: user), to: self.headerView)
                    
                    
                    self.add(childVC: GitRepoController(user: user), to: self.itemViewOne)
                    self.add(childVC: FollowersController(user: user), to: self.itemViewTwo)
                }
                
            case .failure(let error):
                print("error:\(error.localizedDescription)")
                
            }
        }
    }
    
    
    
    fileprivate func configureLayout() {
        profileImage.image = UIImage(named: "avatar-placeholder")
        profileImage.layer.cornerRadius = 5
        profileImage.layer.borderWidth = 0.5
        profileImage.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        view.addSubview(topContainer)
        topContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 180)
        
        
        topContainer.addSubview(profileImage)
        profileImage.anchor(top: topContainer.topAnchor, left: topContainer.leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 80, height: 80)
        
        
        
        let namesStacks = VerticalStackView(arrangedSubviews: [fullnameLabel,usernameLabel])
        
        topContainer.addSubview(namesStacks)
        namesStacks.anchor(top: profileImage.topAnchor, left: profileImage.rightAnchor, bottom: nil, right: topContainer.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        topContainer.addSubview(bioTextlabel)
        bioTextlabel.anchor(top: profileImage.bottomAnchor, left: topContainer.leftAnchor, bottom: topContainer.bottomAnchor, right: topContainer.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 0)
        
        
        
        let commonViews = VerticalStackView(arrangedSubviews: [midContainer, bottomContainer])
        
        commonViews.spacing = 5
        commonViews.distribution = .fillEqually
        commonViews.backgroundColor = .blue
        
        
        
        let reposStack = VerticalStackView(arrangedSubviews: [puplicReposLabel,reposLabel])
        let gistsStack = VerticalStackView(arrangedSubviews: [puplicGists,gistsLabel])
        
        let stackContainer = HorizontalStackView(arrangedSubViews: [reposStack,UIView(),UIView(),gistsStack] )
        stackContainer.distribution = .equalSpacing
        stackContainer.backgroundColor = .yellow
        stackContainer.spacing = 10
        
        
        midContainer.addSubview(stackContainer)
        
        stackContainer.centerXInSuperview()
        
        
        view.addSubview(commonViews)
        commonViews.anchor(top: topContainer.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 200)
        
    }
    
}



