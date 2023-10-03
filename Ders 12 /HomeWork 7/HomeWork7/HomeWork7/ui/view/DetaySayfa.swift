//
//  DetaySayfa.swift
//  HomeWork7
//
//  Created by Musti on 3.10.2023.
//

import UIKit

class DetaySayfa: UIViewController {
    
    @IBOutlet weak var tfGorevAd: UITextField!
    
    var gorev:Gorevler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let g = gorev {
            tfGorevAd.text = g.gorev_ad
        }
        
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ad = tfGorevAd.text, let g = gorev {
            guncelle(gorev_id: g.gorev_id!, gorev_ad: g.gorev_ad!)
        }
    }
    
    func guncelle(gorev_id:Int, gorev_ad:String){
        print("Kişi Güncelle: \(gorev_id) - \(gorev_ad)")
    }
}
