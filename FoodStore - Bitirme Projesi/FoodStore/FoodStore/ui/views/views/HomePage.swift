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
       var viewModel = DetailViewModel()
       var cartLists = [CartFoodModel]()
       var foods:FoodsModel?



    
    override func viewDidLoad() {
            super.viewDidLoad()
            searchBar.backgroundImage = UIImage() // Kenarları kaldırır
            searchBar.layer.borderWidth = 1 // Opsiyonel: Çerçeve kalınlığını ayarlar
            searchBar.layer.borderColor = UIColor.clear.cgColor // Opsiyonel: Çerçeve rengini ayarlar
            
            _ = yemeklerViewModel.yemekListesi.subscribe(onNext: { list in
                self.yemeklerListesi = list
                self.yemeklerCollectionView.reloadData()
            })
        
        _ = viewModel.cartList.subscribe(onNext: { list in
            self.cartLists = list
        })
            design()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            yemeklerViewModel.yemekleriListele()
            viewModel.sepettekiYemekleriGoruntule(kullanici_adi: "mustafa")
            
        }
        
        func design(){
            yemeklerCollectionView.delegate = self
            yemeklerCollectionView.dataSource = self
            
            let design = UICollectionViewFlowLayout()
            design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            design.minimumLineSpacing = 10
            design.minimumInteritemSpacing = 10
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
            foods = yemeklerListesi[indexPath.row]
            /*yemeklerViewModel.sepeteYemekEkle(yemek_adi:food.yemek_adi!, yemek_resim_adi: food.yemek_resim_adi!, yemek_fiyat: Int(food.yemek_fiyat!)!, yemek_siparis_sayisi:1, kullanici_adi: "mustafa")*/
            print("Basıldı *****")
            if let foodObject = foods {
                var sameName = false
                var cartFood = CartFoodModel()
                
                for i in cartLists {
                    if i.yemek_adi == foodObject.yemek_adi {
                        sameName = true
                        cartFood = i
                        break
                    } else {
                        sameName = false
                    }
                }
                if sameName == true {
                    viewModel.sepettenYemekSil(sepet_yemek_id: Int(cartFood.sepet_yemek_id!)!, kullanici_adi: "mustafa")
                    let foodCountValue = (try? viewModel.foodCount.value()) ?? 1
                    viewModel.sepeteYemekEkle(yemek_adi: foodObject.yemek_adi!, yemek_resim_adi: foodObject.yemek_resim_adi!, yemek_fiyat: Int(foodObject.yemek_fiyat!)!, yemek_siparis_sayisi: foodCountValue + Int( cartFood.yemek_siparis_adet!)!, kullanici_adi: "mustafa")
                    print("Yemek Sepete eklendi: \(foodObject.yemek_adi!) - \(foodCountValue)")
                } else {
                    let foodCountValue = (try? viewModel.foodCount.value()) ?? 1
                    viewModel.sepeteYemekEkle(yemek_adi: foodObject.yemek_adi!, yemek_resim_adi: foodObject.yemek_resim_adi!, yemek_fiyat: Int(foodObject.yemek_fiyat!)!, yemek_siparis_sayisi: foodCountValue, kullanici_adi: "mustafa")
                    print("Yemek Sepete eklendi: \(foodObject.yemek_adi!) - \(foodCountValue)")
                }
              
            }
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
        if let imageURL = yemek.yemek_resim_adi, let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(imageURL)") {
            hucre.imageCell.kf.setImage(with: url)
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
