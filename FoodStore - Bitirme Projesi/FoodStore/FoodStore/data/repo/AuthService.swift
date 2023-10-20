//
//  AuthService.swift
//  FoodStore
//
//  Created by Musti on 20.10.2023.
//

import FirebaseAuth

class AuthService {
    static let shared = AuthService()

    func loginUser(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let user = authResult?.user {
                let userModel = UserModel(uid: user.uid, email: user.email ?? "")
                completion(.success(userModel))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }

    func registerUser(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let user = authResult?.user {
                let userModel = UserModel(uid: user.uid, email: user.email ?? "")
                completion(.success(userModel))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
