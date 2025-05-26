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
        let arr = ["https://images.unsplash.com/photo-1678685888221-cda773a3dcdb?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YXBwbGUlMjBpcGhvbmV8ZW58MHx8MHx8fDA%3D",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Apple_Computer_Logo_rainbow.svg/1759px-Apple_Computer_Logo_rainbow.svg.png",
                   "https://t4.ftcdn.net/jpg/03/08/69/75/360_F_308697506_9dsBYHXm9FwuW0qcEqimAEXUvzTwfzwe.jpg",
                   "https://miro.medium.com/v2/resize:fit:728/0*iAMjsZUt3lMh_rQr.jpg"]
        
        let data = PostEntity(id: 2, text: description, user: user, image: arr.randomElement())
        DummtPostManager.shared.addPost(post: data)
    }
}
