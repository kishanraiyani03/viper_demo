//
//  HomeViewModel.swift
//  SocialNetworkDemo
//
//  Created by SOTSYS061 on 24/05/25.
//

import Foundation
import Combine

protocol HomePresentor {
    func fetchPosts()
    func openCreatePost()
    
    func subscribeToState(handler: @escaping (FetchingDataState<[PostEntity]>) -> Void)
}

class DefaultHomePresentor: HomePresentor {
    let interactor:HomeInteractor
    let router:HomeRouter
    
    @Published var fetchingState: FetchingDataState<[PostEntity]> = .init(state: .idle, data: [])
    private var cancellables:[AnyCancellable] = []
    
    init(interactor: HomeInteractor, router: HomeRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    
    func fetchPosts() {
        self.fetchingState.updateState(state: .loading)
        self.interactor.fetchPosts { res in
            switch res {
            case .success(let data):
                self.fetchingState.updateData(data: data)
                self.fetchingState.updateState(state: .idle)
            case .failure(_):
                break
            }
        }
    }
    
    func subscribeToState(handler: @escaping (FetchingDataState<[PostEntity]>) -> Void) {
        self.$fetchingState.sink(receiveValue: handler).store(in: &cancellables)
    }
    
    func openCreatePost() {
        self.router.openCreatePost()
    }
}
