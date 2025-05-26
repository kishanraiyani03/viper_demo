//
//  ViewController.swift
//  SwiftDemos
//
//  Created by SOTSYS009 on 20/01/24.
//

import UIKit

class CreatePostViewController: BaseViewController {

    var model: CreatePostPresentor
    
    init(model: CreatePostPresentor) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var userPickerView: UserPickerView = {
        let view = UserPickerView(presentingViewController: self)
        view.users = [DummyUserManager.user1, DummyUserManager.user2, DummyUserManager.user3]
        return view
    }()
    
    private lazy var txtPostView: UITextView = {
        let view = UITextView()
        view.delegate = self
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 6.0
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var submitButton = {
        let btn = AppButton(
            title: "Submit",
            backgroundColor: .systemGreen,
            titleColor: .white,
            cornerRadius: 12
        )
        btn.addTarget(self, action: #selector(onClickSubmit), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupCustomBackButton()
        self.addSubscriptions()
        self.setup()
    }
    
    func setup() {
        self.view.addSubview(userPickerView)
        userPickerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()
        }
        userPickerView.onUserSelected = { [weak self] user in
            guard let self else { return }
            self.model.userData = user
            self.updateButtonState()
        }
        
        self.view.addSubview(txtPostView)
        txtPostView.snp.makeConstraints { make in
            make.top.equalTo(userPickerView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30))
            make.height.equalTo(200)
        }
        
        self.view.addSubview(submitButton)
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(txtPostView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(txtPostView)
            make.height.equalTo(50)
        }
    }
    
    func addSubscriptions() {
        self.model.subscribeToIsPostAdded { [weak self] _ in
            self?.reset()
        }
    }
    
    @objc func onClickSubmit() {
        self.model.submitButtonClicked()
    }
    
    func updateButtonState() {
        self.submitButton.isUserInteractionEnabled = self.model.validate()
        self.submitButton.alpha = self.model.validate() ? 1.0 : 0.5
    }
    
    func reset() {
        self.userPickerView.selectedUser = nil
        self.txtPostView.text = nil
        self.updateButtonState()
    }
}

extension CreatePostViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.model.postDescription = txtPostView.text
        self.updateButtonState()
    }
}

