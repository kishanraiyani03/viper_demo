//
//  PostListView.swift
//  SocialNetworkDemo
//
//  Created by SOTSYS061 on 24/05/25.
//

import Foundation
import UIKit


class PostListView: UIView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .clear
        view.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseIdentifier)
        return view
    }()
    
    private var posts:[PostEntity] = []
    
    init() {
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = .clear
        
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func refresh(posts: [PostEntity]) {
        self.posts = posts
        self.tableView.reloadData()
    }

}

extension PostListView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseIdentifier, for: indexPath) as! PostCell
        cell.selectionStyle = .none
        let post = posts[indexPath.row]
        cell.configure(with: post)
        return cell
    }
    
}
