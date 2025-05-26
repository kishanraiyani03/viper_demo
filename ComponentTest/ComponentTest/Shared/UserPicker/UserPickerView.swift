//
//  UserPickerView.swift
//  ComponentTest
//
//  Created by SOTSYS061 on 26/05/25.
//

import UIKit

class UserPickerView: UIView {
    
    // MARK: - Public Properties
    
    var selectedUser: UserEntity? {
        didSet {
            nameLabel.text = selectedUser?.name ?? "Select User"
        }
    }
    
    var users: [UserEntity] = [] {
        didSet {
            // Can reload picker if it's open (optional)
        }
    }
    
    var onUserSelected: ((UserEntity) -> Void)?
    
    // MARK: - Private UI Elements
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Select User"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private weak var presentingViewController: UIViewController?
    
    // MARK: - Initializer
    
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
        super.init(frame: .zero)
        setupUI()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        nameLabel.addGestureRecognizer(tap)
    }
    
    @objc private func handleTap() {
        let pickerVC = UserListViewController(users: users)
        pickerVC.onUserSelected = { [weak self] user in
            self?.selectedUser = user
            self?.onUserSelected?(user)
        }
        
        let navController = UINavigationController(rootViewController: pickerVC)
        navController.modalPresentationStyle = .automatic
        presentingViewController?.present(navController, animated: true)
    }
}
