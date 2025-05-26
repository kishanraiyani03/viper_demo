//
//  AppButton.swift
//  ComponentTest
//
//  Created by SOTSYS061 on 25/05/25.
//

import Foundation
import UIKit


import UIKit

class AppButton: UIButton {
    
    // Custom initializer
    init(
        title: String,
        backgroundColor: UIColor = .systemBlue,
        titleColor: UIColor = .white,
        cornerRadius: CGFloat = 8.0
    ) {
        super.init(frame: .zero)
        configureButton(
            title: title,
            backgroundColor: backgroundColor,
            titleColor: titleColor,
            cornerRadius: cornerRadius
        )
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // Provide default styling if initialized from storyboard
        configureButton(title: "Button")
    }
    
    private func configureButton(
        title: String,
        backgroundColor: UIColor = .systemBlue,
        titleColor: UIColor = .white,
        cornerRadius: CGFloat = 8.0
    ) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
    }
}

