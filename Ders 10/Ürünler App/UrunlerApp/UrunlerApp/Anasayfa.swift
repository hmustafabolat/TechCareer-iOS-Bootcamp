//
//  ViewController.swift
//  UrunlerApp
//
//  Created by Musti on 26.09.2023.
//

import UIKit

class Anasayfa: UIViewController {
    @IBOutlet weak var urunlerTableView: UITableView!
    
    var urunlerListesi = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let u1 = Urunler(id: 1, ad: "Macbook Pro 14", resim : "bilgisayar", fiyat: 43000)
        let u2 = Urunler(id: 2, ad: "Rayban Club Master", resim : "gozluk", fiyat: 2500)
        let u3 = Urunler(id: 3, ad: "Sony ZX Series", resim: "kulaklik", fiyat: 40000)
        let u4 = Urunler(id: 4, ad: "Gio Armani", resim : "parfum", fiyat: 2000)
        let u5 = Urunler(id: 5, ad: "Casio X Series", resim : "saat", fiyat: 8000)
        let u6 = Urunler(id: 6, ad: "Dyson V8", resim : "supurge", fiyat: 18000)
        let u7 = Urunler(id: 7, ad: "IPhone 13", resim : "telefon", fiyat: 32000)
        urunlerListesi.append(u1)
        urunlerListesi.append(u2)
        urunlerListesi.append(u3)
        urunlerListesi.append(u4)
        urunlerListesi.append(u5)
        urunlerListesi.append(u6)
        urunlerListesi.append(u7)
       
        urunlerTableView.dataSource = self
        urunlerTableView.delegate = self
        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
    }
}

extension Anasayfa : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
        
        let urun = urunlerListesi [indexPath.row]
        
        hucre.imageViewUrun.image = UIImage(named: urun.resim!)
        hucre.labelUrunAd.text = urun.ad
        hucre.labelUrunFiyat.text = "\(urun.fiyat!) ₺"
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.arkaplan.layer.cornerRadius = 10
        return hucre
    }
    
}
