//
//  ViewController.swift
//  FoodStore
//
//  Created by Musti on 5.10.2023.
//

import UIKit

class HomePage: UIViewController {
    
    @IBOutlet weak var yemeklerCollectionView: UICollectionView!
    
    var yemeklerListesi = [Yemekler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let y1 = Yemekler(yemek_id: "1", yemek_adi: "Salata", yemek_resim_adi: "salad", yemek_fiyat: "55")
        let y2 = Yemekler(yemek_id: "2", yemek_adi: "Salata", yemek_resim_adi: "salad", yemek_fiyat: "55")
        let y3 = Yemekler(yemek_id: "3", yemek_adi: "Salata", yemek_resim_adi: "salad", yemek_fiyat: "55")
        let y4 = Yemekler(yemek_id: "4", yemek_adi: "Salata", yemek_resim_adi: "salad", yemek_fiyat: "55")
        let y5 = Yemekler(yemek_id: "5", yemek_adi: "Salata", yemek_resim_adi: "salad", yemek_fiyat: "55")
        let y6 = Yemekler(yemek_id: "6", yemek_adi: "Salata", yemek_resim_adi: "salad", yemek_fiyat: "55")
        let y7 = Yemekler(yemek_id: "7", yemek_adi: "Salata", yemek_resim_adi: "salad", yemek_fiyat: "55")
        
        yemeklerListesi.append(y1)
        yemeklerListesi.append(y2)
        yemeklerListesi.append(y3)
        yemeklerListesi.append(y4)
        yemeklerListesi.append(y5)
        yemeklerListesi.append(y6)
        yemeklerListesi.append(y7)
        
        yemeklerCollectionView.delegate = self
        yemeklerCollectionView.dataSource = self
        
        let tasarim = UICollectionViewFlowLayout()
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumLineSpacing = 10
        tasarim.minimumInteritemSpacing = 10
        
        //10 x 10 x 10 = 30
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.6)
        
        yemeklerCollectionView.collectionViewLayout = tasarim
        
    }
    @IBAction func cartButton(_ sender: Any) {
        performSegue(withIdentifier: "toCart", sender: nil)
    }
    
}

extension HomePage : UICollectionViewDelegate, UICollectionViewDataSource, HucreProtocol{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yemeklerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionVC", for: indexPath) as! YemeklerHucre
        
        let yemek = yemeklerListesi[indexPath.row]
        
        hucre.imageCell.image = UIImage(named: yemek.yemek_resim_adi!)
        hucre.titleLabel.text = "\(yemek.yemek_adi!)"
        hucre.priceLabel.text = "\(yemek.yemek_fiyat!) ₺"
        
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3
        hucre.layer.cornerRadius = 10
        
        hucre.indexPath = indexPath
        hucre.hucreProtocol = self
        
        return hucre
    }
    
    func sepeteEkleTikla(indexPath: IndexPath) {
        let yemek = yemeklerListesi[indexPath.row]
        print("\(yemek.yemek_adi!) sepete eklendi.")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = yemeklerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: yemek)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let yemek = sender as? Yemekler{
                let gidilecekVC = segue.destination as! DetailPage
                gidilecekVC.yemek = yemek
            }
        }
    }
    
    
    
}
