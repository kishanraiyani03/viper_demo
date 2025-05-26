//
//  CreatePostViewModel.swift
//  SwiftDemos
//
//  Created by SOTSYS009 on 20/01/24.
//

import Foundation
import Combine

protocol CreatePostPresentor {
    func validate() -> Bool
    var userData:UserEntity? { get set }
    var postDescription:String? { get set }
    func submitButtonClicked()
    
    func goBack()
    func subscribeToIsPostAdded(handler:@escaping (Bool) -> Void)
}

class DefaultCreatePostPresentor {
    let interactor: CreatePostInteractor
    let router: CreatePostRouter
    var userData:UserEntity?
    var postDescription:String?
    
    @Published var isPostAdded:Bool = false
    
    private var cancellables:[AnyCancellable] = []
    
    init(interactor: CreatePostInteractor, router: CreatePostRouter) {
        self.interactor = interactor
        self.router = router
    }
}

extension DefaultCreatePostPresentor: CreatePostPresentor {
    
    func subscribeToIsPostAdded(handler: @escaping (Bool) -> Void) {
        $isPostAdded.sink(receiveValue: handler).store(in: &cancellables)
    }
    
    func validate() -> Bool {
        if userData == nil {
            return false
        }
        
        if (postDescription?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0) == 0 {
            return false
        }
        
        return true
    }
    
    func submitButtonClicked() {
        if self.validate() {
            interactor.createPost(user: self.userData!, description: self.postDescription!)
            self.isPostAdded = true
            
            self.router.goBack()
        }
    }
    
    func goBack() {
        self.router.goBack()
    }
}
