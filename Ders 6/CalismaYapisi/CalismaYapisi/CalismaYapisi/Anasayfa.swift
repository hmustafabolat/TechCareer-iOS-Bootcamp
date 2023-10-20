//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Musti on 14.09.2023.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var labelAnasayfa: UILabel!
    
    var sayac = 0
    
    override func viewDidLoad() {
        //Sayfa açıldığında bir kere çalışır.
        super.viewDidLoad()
        print("Yaşam döngüsü: viewDidLoad")
        labelAnasayfa.text = String(sayac)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Sayfa her göründüğünde çalışır.
        //Sayfaya geri dönüşü takip edebilirsiniz.
        print("Yaşam Döngüsü: viewWillAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //Sayfa her görünmez olduğunda çalışır.
        print("Yaşam döngüsü: viewDidDisappear")
    }

    @IBAction func buttonTikla(_ sender: Any) {
        sayac += 1
        labelAnasayfa.text = String(sayac)
        if sayac == 5{
            performSegue(withIdentifier: "oyunEkraninaGecis", sender: nil)
        }
    }
    
    @IBAction func buttonBasla(_ sender: Any) {
        let kisi = Kisiler(ad: "Mustafa", yas: 14, boy: 1.84, bekar: true)
        performSegue(withIdentifier: "oyunEkraninaGecis", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepare metodu çalıştı.")
        
        if segue.identifier == "oyunEkraninaGecis"{
            print("Oyun ekranı çalıştı.")
            
            if let veri = sender as? Kisiler {
                print("Veri: \(veri)")
                let gidilecekVC = segue.destination as! OyunEkrani //UIViewController'dan -> OyunEkrani
                gidilecekVC.kisiNesnesi = veri
            }
        }
        
    }
    
    @IBAction func buttonEkle(_ sender: Any) {
        print("Ekle Tıklandı...")
    }
    
    @IBAction func buttonCikis(_ sender: Any) {
        print("Çıkış Tıklandı...")
    }
    
}

