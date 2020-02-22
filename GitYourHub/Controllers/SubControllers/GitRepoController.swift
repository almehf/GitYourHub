//
//  GitRepoController.swift
//  GitYourHub
//
//  Created by Fahad Almehawas  on 2/20/20.
//  Copyright © 2020 Fahad Al. All rights reserved.
//

import UIKit
class GitRepoController: GitInfoController {


    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }

 
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, with: user.publicGists)
    }
}
