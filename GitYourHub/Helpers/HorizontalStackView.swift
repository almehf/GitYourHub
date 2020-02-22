//
//  HorizontalStackView.swift
//  Apple_Music
//
//  Created by Fahad Almehawas  on 2/2/20.
//  Copyright © 2020 Fahad Almehaws. All rights reserved.
//

import UIKit


class HorizontalStackView: UIStackView {
    init(arrangedSubViews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubViews.forEach({addArrangedSubview($0)})
        self.spacing = spacing
        self.axis = .horizontal
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
