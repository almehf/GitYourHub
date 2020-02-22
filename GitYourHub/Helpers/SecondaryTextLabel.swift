//
//  SecondaryTextLabel.swift
//  GitYourHub
//
//  Created by Fahad Almehawas  on 2/20/20.
//  Copyright © 2020 Fahad Al. All rights reserved.
//

import UIKit

class SecondaryTextLabel: UILabel {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configureLayout()
    }
    
    private func configureLayout() {
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
