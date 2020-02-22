//
//  InfoItemViews.swift
//  GitYourHub
//
//  Created by Fahad Almehawas  on 2/20/20.
//  Copyright © 2020 Fahad Al. All rights reserved.
//

import Foundation
import UIKit

enum ItemInfoType {
    case repos, gists, following, followers
}

class InfoItemViews: UIView {

 
    let symbolIcon = UIImageView()
    let titleLabel = TitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = TitleLabel(textAlignment: .center, fontSize: 14)

  
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    
 
    private func configure() {
        addSubview(symbolIcon)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symbolIcon.translatesAutoresizingMaskIntoConstraints = false
        symbolIcon.contentMode = .scaleAspectFill
        symbolIcon.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolIcon.topAnchor.constraint(equalTo: self.topAnchor),
            symbolIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolIcon.heightAnchor.constraint(equalToConstant: 20),
            symbolIcon.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolIcon.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolIcon.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolIcon.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType: ItemInfoType, with count: Int) {
        switch itemInfoType {
        case .repos:
            symbolIcon.image = UIImage(systemName: GitSymbols.repos)
            titleLabel.text = "Public Repos"
        case .gists:
            symbolIcon.image = UIImage(systemName: GitSymbols.gists)
            titleLabel.text = "Public Gists"
        case .following:
            symbolIcon.image = UIImage(systemName: GitSymbols.following)
            titleLabel.text = "Following"
        case .followers:
            symbolIcon.image = UIImage(systemName: GitSymbols.followers)
            titleLabel.text = "Followers"
        }
        
        countLabel.text = String(count)
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
