import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    
    let model: HomePresentor

    init(model: HomePresentor) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
       
    private lazy var submitButton = {
        let btn = AppButton(
            title: "Create Post",
            backgroundColor: .systemGreen,
            titleColor: .white,
            cornerRadius: 12
        )
        btn.addTarget(self, action: #selector(onClickCreatePost), for: .touchUpInside)
        return btn
    }()

    
    private lazy var loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        view.color = .white
        view.isHidden = true
        return view
    }()
    
    private lazy var postsView: PostListView = {
        let view = PostListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addListeners()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.model.fetchPosts()
    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(red: 9/255, green: 22/255, blue: 46/255, alpha: 1.0)
        
        self.view.addSubview(submitButton)
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
            make.height.equalTo(50)
        }
        
        self.view.addSubview(postsView)
        postsView.snp.makeConstraints { make in
            make.top.equalTo(submitButton.snp.bottom).offset(20)
            make.leading.trailing.equalTo(submitButton)
            make.bottom.equalToSuperview().offset(-60)
        }
        
        self.view.addSubview(loadingView)
        loadingView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        model.fetchPosts()
    }
    
    func addListeners() {
        self.model.subscribeToState { state in
            switch state.state {
            case .idle:
                self.postsView.isHidden = false
                self.postsView.refresh(posts: state.data)
                self.loadingView.isHidden = true
            case .loading:
                self.postsView.isHidden = true
                self.loadingView.isHidden = false
            }
        }
    }
    
    @objc func onClickCreatePost() {
        self.model.openCreatePost()
    }
    
    
}
