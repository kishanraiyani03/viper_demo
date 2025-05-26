//
//  BaseViewController.swift
//  ComponentTest
//
//  Created by SOTSYS061 on 26/05/25.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    func setupCustomBackButton() {
        let backButton = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 17, weight: .medium)
        let image = UIImage(systemName: "chevron.backward", withConfiguration: config)
        
        backButton.setImage(image, for: .normal)
        backButton.setTitle(" Back", for: .normal)
        backButton.tintColor = .label
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
        }
    }
    
    @objc private func handleBack() {
        if let nav = navigationController {
            nav.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
}
