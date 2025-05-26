//
//  UserListViewController.swift
//  ComponentTest
//
//  Created by SOTSYS061 on 26/05/25.
//


import UIKit

class UserListViewController: UITableViewController {
    
    private let users: [UserEntity]
    var onUserSelected: ((UserEntity) -> Void)?
    
    init(users: [UserEntity]) {
        self.users = users
        super.init(style: .plain)
        self.title = "Select User"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "UserCell")
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = users[indexPath.row]
        dismiss(animated: true) {
            self.onUserSelected?(selected)
        }
    }
}
