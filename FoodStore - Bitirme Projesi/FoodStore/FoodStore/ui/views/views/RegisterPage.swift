//
//  RegisterPage.swift
//  FoodStore
//
//  Created by Musti on 20.10.2023.
//

import UIKit

class RegisterPage: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    var authService = AuthService.shared

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerButton(_ sender: Any) {
        print("Register Pushed")
        guard let email = emailTF.text, let password = passwordTF.text else {
            // Eğer email veya password nil ise, kullanıcıya bir hata mesajı gösterebilirsiniz.
            // Örnek:
            showAlert(message: "Lütfen email ve şifre girin.")
            return
        }

        authService.registerUser(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let userModel):
                // Kayıt başarılı
                print("Kayıt başarılı. Kullanıcı: \(userModel.email)")
            case .failure(let error):
                // Kayıt hatası
                print("Kayıt hatası: \(error.localizedDescription)")
            }
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
