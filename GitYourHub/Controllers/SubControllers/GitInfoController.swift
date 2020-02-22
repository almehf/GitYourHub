//
//  GitInfoController.swift
//  GitYourHub
//
//  Created by Fahad Almehawas  on 2/20/20.
//  Copyright © 2020 Fahad Al. All rights reserved.
//

import Foundation
import UIKit

class GitInfoController: UIViewController {
    
  
    var user: User!
    let stackView = UIStackView()
    let itemInfoViewOne = InfoItemViews()
    let itemInfoViewTwo = InfoItemViews()
    
    // MARK: - INIT USER
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        consturctBackgroundView()
        configureLayout()
        configureStackView()
    }
    
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
    }
    
    
    
    
    private func consturctBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor = UIColor(red: 0.4588, green: 0.8549, blue: 0.9176, alpha: 1.0)
    }
    
    
    private func configureLayout() {
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
