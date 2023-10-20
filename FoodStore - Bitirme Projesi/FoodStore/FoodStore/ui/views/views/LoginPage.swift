//
//  LoginPage.swift
//  FoodStore
//
//  Created by Musti on 20.10.2023.
//

import UIKit

class LoginPage: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    var authService = AuthService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        guard let email = emailTF.text, let password = passwordTF.text else {
                    return
                }

                authService.loginUser(email: email, password: password) { [weak self] result in
                    switch result {
                    case .success(let userModel):
                        // Oturum açma başarılı
                        self?.performSegue(withIdentifier: "homeCollectionVC", sender: nil)
                        print("Oturum açma başarılı. Kullanıcı: \(userModel.email)")
                    case .failure(let error):
                        // Oturum açma hatası
                        print("Oturum açma hatası: \(error.localizedDescription)")
                    }
                }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier: "toRegister", sender: nil)
    }
    
}
