//
//  UserModel.swift
//  FoodStore
//
//  Created by Musti on 20.10.2023.
//

struct UserModel {
    var uid: String
    var email: String
     // Kullanıcı adı

    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
        
    }
}
