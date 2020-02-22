//
//  ProfileHeaderController.swift
//  GitYourHub
//
//  Created by Fahad Almehawas  on 2/20/20.
//  Copyright © 2020 Fahad Al. All rights reserved.
//

import UIKit

class ProfileHeaderController: UIViewController {


    var user: User!
    let avatarImageView = AvatarLoader_Cahcer(frame: .zero)
    let usernameLabel = TitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = SecondaryTextLabel(fontSize: 18)
    let locationIcon = UIImageView()
    let locationLabel = SecondaryTextLabel(fontSize: 18)
    let bioLabel = BodyTextLabel(textAlignment: .left)
    
    // MARK: - Init
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureLayout()
        setupItems()
    }
    
  
    func setupItems() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? ""
        bioLabel.text = user.bio ?? ""
        bioLabel.numberOfLines = 3
        
        locationIcon.image = UIImage(systemName: GitSymbols.location)
        locationIcon.tintColor = .secondaryLabel
    }
    
     
    func addSubviews() {
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationIcon)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
        
    }

    func configureLayout() {
        let padding: CGFloat  = 20
        let textImagePadding: CGFloat = 12
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        
    
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
            locationIcon.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationIcon.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationIcon.widthAnchor.constraint(equalToConstant: 20),
            locationIcon.heightAnchor.constraint(equalToConstant: 20),
            
            
            locationIcon.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationIcon.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationIcon.widthAnchor.constraint(equalToConstant: 20),
            locationIcon.heightAnchor.constraint(equalToConstant: 20),
            
          
         
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

