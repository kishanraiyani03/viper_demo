//
//  PostCell.swift
//  SocialNetworkDemo
//
//  Created by SOTSYS061 on 24/05/25.
//

import Foundation
import UIKit
import Kingfisher

class PostCell: UITableViewCell {
    static let reuseIdentifier = "PostCell"
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let iconView: UIImageView = {
        let iv = UIImageView()
        iv.snp.makeConstraints { make in
            make.width.height.equalTo(50)
        }
        iv.layer.cornerRadius = 25.0
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.image = .init(systemName: "person.circle.fill")
        return iv
    }()
    
    // MARK: - UI Components
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
        }
        return view
    }()
    
    private lazy var seperatorView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        return v
    }()
    
    // MARK: - Configuration
    func configure(with post: PostEntity) {
        nameLabel.text = post.user.name
        userNameLabel.text = "@" + post.user.userName
        postDescriptionLabel.text = post.text
        
        if let url = URL(string: post.image ?? "") {
            postImage.isHidden = false
            postImage.kf.setImage(with: url)
        }
        else {
            postImage.isHidden = true
        }
        
    }
    
    // MARK: - Setup
    private func setupUI() {
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        let mainstack = UIStackView(axis: .horizontal,
                                    distribution: .fill,
                                    alignment: .top, spacing: 10)
        mainstack.addPadding(inset: UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10))
        
        let nameStack = UIStackView(axis: .horizontal,
                                    distribution: .fill,
                                    alignment: .top, spacing: 10)
        nameStack.addArrangedSubviews(views: nameLabel, userNameLabel, UIView())
        
        let vstack = UIStackView(axis: .vertical,
                                 distribution: .fill,
                                 alignment: .leading,
                                 spacing: 16)
        vstack.addArrangedSubviews(views: nameStack, postDescriptionLabel, postImage)
        
        mainstack.addArrangedSubviews(views: iconView, vstack)
        
        self.addSubview(mainstack)
        mainstack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.addSubview(seperatorView)
        seperatorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}


extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis,
                     distribution:Distribution,
                     alignment:Alignment,
                     spacing: CGFloat) {
        self.init(frame: .zero)
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
    
    func addArrangedSubviews(views: UIView...) {
        views.forEach { v in
            self.addArrangedSubview(v)
        }
    }
    
    func addPadding(inset: UIEdgeInsets) {
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = inset
    }
}
