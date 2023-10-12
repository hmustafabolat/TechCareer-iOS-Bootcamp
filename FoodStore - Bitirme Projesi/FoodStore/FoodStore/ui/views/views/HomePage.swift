//
//  ViewController.swift
//  FoodStore
//
//  Created by Musti on 5.10.2023.
//

import UIKit
import RxSwift

class HomePage: UIViewController {
    
    @IBOutlet weak var yemeklerCollectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var yemeklerListesi = [Yemekler]()
    var yemeklerViewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.backgroundImage = UIImage() // Kenarları kaldırır
        searchBar.layer.borderWidth = 1 // Opsiyonel: Çerçeve kalınlığını ayarlayabilirsiniz
        searchBar.layer.borderColor = UIColor.clear.cgColor // Opsiyonel: Çerçeve rengini ayarlayabilirsiniz
        //
        _ = yemeklerViewModel.yemekListesi.subscribe(onNext: { list in
            self.yemeklerListesi = list
            self.yemeklerCollectionView.reloadData()
            print(list.count)
        })
        
        yemeklerCollectionView.delegate = self
        yemeklerCollectionView.dataSource = self
        
        let tasarim = UICollectionViewFlowLayout()
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumLineSpacing = 10
        tasarim.minimumInteritemSpacing = 10
        
        //10 x 10 x 10 = 30
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.5)
        
        yemeklerCollectionView.collectionViewLayout = tasarim
        
    }
    override func viewWillAppear(_ animated: Bool) {
        yemeklerViewModel.yemekleriListele()
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
        
        if let yemekResimAdi = yemek.yemek_resim_adi {
            yemeklerViewModel.yemekResminiYukle(yemekAdi: yemekResimAdi) { image in
                DispatchQueue.main.async {
                    hucre.imageCell.image = image
                }
            }
        }
        
        //hucre.imageCell.image = UIImage(named: yemek.yemek_resim_adi!)
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
