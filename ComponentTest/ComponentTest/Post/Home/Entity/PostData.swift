//
//  PostData.swift
//  SocialNetworkDemo
//
//  Created by SOTSYS061 on 24/05/25.
//

import Foundation


class PostEntity {
    let id:Int
    let text: String
    let user: UserEntity
    
    init(id: Int, text: String, user: UserEntity) {
        self.id = id
        self.text = text
        self.user = user
    }
    
    // MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}



class DummtPostManager {
    static var shared = DummtPostManager()
    var posts: [PostEntity] = []
    
    init() {
        
        let post1 = PostEntity(id: 1, text: "Dave watched as the forest burned up on the hill, only a few miles from her house. The car had been hastily packed and Marta was inside trying to round up the last of the pets. Dave went through his mental list of the most important papers and documents that they couldn't leave behind. He scolded himself for not having prepared these better in advance and hoped that he had remembered everything that was needed. He continued to wait for Marta to appear with the pets, but she still was nowhere to be seen.", user: DummyUserManager.user1)
        let post2 = PostEntity(id: 2, text: "All he wanted was a candy bar. It didn't seem like a difficult request to comprehend, but the clerk remained frozen and didn't seem to want to honor the request. It might have had something to do with the gun pointed at his face.", user: DummyUserManager.user2)
        let post3 = PostEntity(id: 3, text: "Hopes and dreams were dashed that day. It should have been expected, but it still came as a shock. The warning signs had been ignored in favor of the possibility, however remote, that it could actually happen. That possibility had grown from hope to an undeniable belief it must be destiny. That was until it wasn't and the hopes and dreams came crashing down.", user: DummyUserManager.user3)
        
        self.posts = [post1, post2, post3]
    }
    
    func addPost(post: PostEntity) {
        self.posts.append(post)
    }
}
