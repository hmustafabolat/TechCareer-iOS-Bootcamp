//
//  KayitSayfa.swift
//  HomeWork7
//
//  Created by Musti on 3.10.2023.
//

import UIKit

class KayitSayfa: UIViewController {
    
    @IBOutlet weak var tfGorevAd: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let ad = tfGorevAd.text{
            kaydet(gorev_ad: ad)
        }
    }
    
    func kaydet(gorev_ad:String){
        print("Kişi Kaydet: \(gorev_ad)")
    }
    
}
