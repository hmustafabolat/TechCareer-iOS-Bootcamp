//
//  ViewController.swift
//  KullaniciEtkilesimi
//
//  Created by Musti on 19.09.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ _ in
            print("İptal seçildi...")
        }
        alert.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){ _ in
            print("Tamam seçildi...")
        }
        alert.addAction(tamamAction)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func buttonActionSheet(_ sender: Any) {
        let alert = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .actionSheet)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ _ in
            print("İptal seçildi...")
        }
        alert.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){ _ in
            print("Tamam seçildi...")
        }
        alert.addAction(tamamAction)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func buttonOzelAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Sistem Giriş", message: "Mailinizi ve şifrenizi giriniz.", preferredStyle: .alert)
        
        alert.addTextField{ textField in //0.
            textField.placeholder = "E-mail"
            textField.keyboardType = .emailAddress
        }
        alert.addTextField{ textField in //1.
            textField.placeholder = "Şifre"
            textField.keyboardType = .numberPad
            textField.isSecureTextEntry = true
        }
        
        let girisAction = UIAlertAction(title: "Giriş", style: .cancel){ _ in
            let textFieldEmail = alert.textFields![0] as UITextField
            let textFieldSifre = alert.textFields![1] as UITextField
            
            if let email = textFieldEmail.text , let sifre = textFieldSifre.text{
                print("Email : \(email)")
                print("Şifre : \(sifre)")
            }
        }
        alert.addAction(girisAction)
        self.present(alert, animated: true)
    }
    

}

