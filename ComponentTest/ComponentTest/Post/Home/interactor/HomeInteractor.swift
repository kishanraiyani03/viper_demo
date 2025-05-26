//
//  HomeUseCase.swift
//  SocialNetworkDemo
//
//  Created by SOTSYS061 on 24/05/25.
//

import Foundation


protocol HomeInteractor {
    func fetchPosts(completion: @escaping (Result<[PostEntity], Error>) -> Void)
}

class DefaultHomeInteractor: HomeInteractor {
    func fetchPosts(completion: @escaping (Result<[PostEntity], any Error>) -> Void) {
        let arr = DummtPostManager.shared.posts
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            completion(.success(arr))
        })
    }
}
