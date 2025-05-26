//
//  User.swift
//  SocialNetworkDemo
//
//  Created by SOTSYS061 on 24/05/25.
//

import Foundation


class UserEntity {
    let userName:String
    let name:String
    let profileImage:String
    
    init(userName: String, name: String, profileImage: String) {
        self.userName = userName
        self.name = name
        self.profileImage = profileImage
    }
}

class DummyUserManager {
    static let user1 = UserEntity(userName: "K03", name: "Kishan", profileImage: "")
    static let user2 = UserEntity(userName: "Manoo_", name: "Manoo", profileImage: "")
    static let user3 = UserEntity(userName: "Virat09", name: "Virat", profileImage: "")
}

