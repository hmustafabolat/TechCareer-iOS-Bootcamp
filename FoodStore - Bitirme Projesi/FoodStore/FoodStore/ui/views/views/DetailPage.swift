//
//  DetailPage.swift
//  FoodStore
//
//  Created by Musti on 10.10.2023.
//

import UIKit
import RxSwift
import Kingfisher

class DetailPage: UIViewController {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var foodAbout: UILabel!
    @IBOutlet weak var totalFoodPrice: UILabel!
    
    var foods:FoodsModel?
    var viewModel = DetailViewModel()
    var cartLists = [CartFoodModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = foods{
            if let imageURL = y.yemek_resim_adi, let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(imageURL)") {
                foodImage.kf.setImage(with: url)
            }
            foodName.text = y.yemek_adi
            _ = viewModel.totalPrice.subscribe(onNext: { price in
                self.totalFoodPrice.text = "\(price)₺"
            })
            foodPrice.text = "\(y.yemek_fiyat!)₺"
            _ = viewModel.foodCount.subscribe(onNext: { [weak self] count in
                self?.countLabel.text = String(count)
            })
            _ = viewModel.cartList.subscribe(onNext: { cartList in
                self.cartLists = cartList
            })
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.frepo.sepettekiYemekleriGoruntule(kullanici_adi: "mustafa")
    }
    
    @IBAction func addToCartButton(_ sender: Any) {
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
                navigationController?.popViewController(animated: true)
            } else {
                let foodCountValue = (try? viewModel.foodCount.value()) ?? 1
                viewModel.sepeteYemekEkle(yemek_adi: foodObject.yemek_adi!, yemek_resim_adi: foodObject.yemek_resim_adi!, yemek_fiyat: Int(foodObject.yemek_fiyat!)!, yemek_siparis_sayisi: foodCountValue, kullanici_adi: "mustafa")
                print("Yemek Sepete eklendi: \(foodObject.yemek_adi!) - \(foodCountValue)")
                navigationController?.popViewController(animated: true)
            }
          
        }
    }
    
    
    @IBAction func minusButton(_ sender: Any) {
        viewModel.decreaseFoodCount()
        viewModel.calculatePrice(price: Int((foods?.yemek_fiyat)!)!)
    }
    
    @IBAction func plusButton(_ sender: Any) {
        viewModel.increaseFoodCount()
        viewModel.calculatePrice(price: Int((foods?.yemek_fiyat)!)!)
    }
    
    @IBAction func toCartButton(_ sender: Any) {
        performSegue(withIdentifier: "toCartPage", sender: nil)
    }
    
    @IBAction func addCartButton(_ sender: Any) {
       
    }
    
}
