//
//  ViewController.swift
//  FoodStore
//
//  Created by Musti on 5.10.2023.
//

import UIKit
import RxSwift
import Kingfisher

class HomePage: UIViewController {
    
    @IBOutlet weak var yemeklerCollectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var yemeklerListesi = [FoodsModel]()
    var yemeklerViewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.backgroundImage = UIImage() // Kenarları kaldırır
        searchBar.layer.borderWidth = 1 // Opsiyonel: Çerçeve kalınlığını ayarlar
        searchBar.layer.borderColor = UIColor.clear.cgColor // Opsiyonel: Çerçeve rengini ayarlar
        
        _ = yemeklerViewModel.yemekListesi.subscribe(onNext: { list in
            self.yemeklerListesi = list
            self.yemeklerCollectionView.reloadData()
        })
        design()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        yemeklerViewModel.yemekleriListele()
    }
    
    func design(){
        yemeklerCollectionView.delegate = self
        yemeklerCollectionView.dataSource = self
        
        let design = UICollectionViewFlowLayout()
        
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumLineSpacing = 10
        design.minimumInteritemSpacing = 10
        
        //10 x 10 x 10 = 30
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        
        design.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.5)
        
        yemeklerCollectionView.collectionViewLayout = design
        
    }
    
    func sepeteEkleTikla(indexPath: IndexPath) {
        _ = yemeklerListesi[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let data = sender as? FoodsModel {
                let detailVC = segue.destination as! DetailPage
                detailVC.foods = data
            }
        }
    }
    
    @objc func buttonAddToCart(sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let food = yemeklerListesi[indexPath.row]
        yemeklerViewModel.sepeteYemekEkle(yemek_adi: food.yemek_adi!, yemek_resim_adi: food.yemek_resim_adi!, yemek_fiyat: Int(food.yemek_fiyat!)!, yemek_siparis_sayisi: 1, kullanici_adi: "mustafa")
    }
    
    
    @IBAction func addCartButton(_ sender: Any) {
        
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
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionVC", for: indexPath) as! YemeklerCell
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3
        hucre.layer.cornerRadius = 10
        let yemek = yemeklerListesi[indexPath.row]
        if let yemekResimAdi = yemek.yemek_resim_adi {
            yemeklerViewModel.yemekResminiYukle(yemekAdi: yemekResimAdi) { image in
                DispatchQueue.main.async {
                    hucre.imageCell.image = image
                }
            }
        }
        hucre.titleLabel.text = "\(yemek.yemek_adi!)"
        hucre.priceLabel.text = "\(yemek.yemek_fiyat!) ₺"
        hucre.addCartButton.tag = indexPath.row
        hucre.addCartButton.addTarget(self, action: #selector(buttonAddToCart), for: .touchUpInside)
        hucre.indexPath = indexPath
        hucre.hucreProtocol = self
        
        return hucre
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = yemeklerListesi[indexPath.row]
        let selectedFood = yemeklerListesi[indexPath.row]
        _ = FoodDetailModel(food: selectedFood, index: indexPath.row)
        performSegue(withIdentifier: "toDetail", sender: yemek)
    }
}
