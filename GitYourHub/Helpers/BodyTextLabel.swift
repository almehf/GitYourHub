//
//  BodyTextLabel.swift
//  GitYourHub
//
//  Created by Fahad Almehawas  on 2/20/20.
//  Copyright © 2020 Fahad Al. All rights reserved.
//


import UIKit

class BodyTextLabel: UILabel {

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    

    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configureLayout()
    }
    

    private func configureLayout() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        lineBreakMode = .byWordWrapping
        minimumScaleFactor = 0.75
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       

}

