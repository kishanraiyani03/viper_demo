//
//  CreatePostInteractor.swift
//  SwiftDemos
//
//  Created by SOTSYS009 on 20/01/24.
//

import Foundation

protocol CreatePostInteractor {
    func createPost(user: UserEntity, description: String)
}

class DefaultCreatePostInteractor {
    
}


extension DefaultCreatePostInteractor: CreatePostInteractor {
    func createPost(user: UserEntity, description: String) {
        let data = PostEntity(id: 2, text: description, user: user)
        DummtPostManager.shared.addPost(post: data)
    }
}
