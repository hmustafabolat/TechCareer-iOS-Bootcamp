//
//  ViewController.swift
//  UserDefaultsKullanimi
//
//  Created by Musti on 28.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelSayac: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ud = UserDefaults.standard
        
        //Kayıt
        ud.set("Ahmet", forKey: "ad")
        ud.set(180, forKey: "boy")
        
        //Silme
        //ud.removeObject(forKey: "ad")
        
        //Okuma
        let gelenAd = ud.string(forKey: "ad") ?? "İsim yok"
        let gelenBoy = ud.double(forKey: "boy")
        print("Gelend ad: \(gelenAd)")
        print("Gelen boy: \(gelenBoy)")
        
        //Sayaç Uygulama
        var sayac = ud.integer(forKey: "sayac ")
        sayac = sayac + 1
        ud.set(sayac, forKey: "sayac")
        labelSayac.text = "Açılış Sayısı: \(sayac)"
        
    }
}

