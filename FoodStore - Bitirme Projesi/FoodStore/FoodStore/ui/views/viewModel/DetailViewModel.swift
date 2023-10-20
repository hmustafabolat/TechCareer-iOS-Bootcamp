//
//  DetailViewModel.swift
//  FoodStore
//
//  Created by Musti on 10.10.2023.
//

import Foundation
import RxSwift

class DetailViewModel{
    var frepo = FoodStoreDaoRepository()
    var foodCount = BehaviorSubject<Int>(value: 1)
    var totalPrice = BehaviorSubject<Int>(value: 0)
    var cartList = BehaviorSubject<[CartFoodModel]>(value: [CartFoodModel]())
    
    init (){
        totalPrice = frepo.totalPrice
        foodCount = frepo.foodCount
        cartList = frepo.cartList
    }
    func sepeteYemekEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_sayisi: Int, kullanici_adi: String ){
        frepo.sepeteYemekEkle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_sayisi: yemek_siparis_sayisi, kullanici_adi: kullanici_adi)
        
    }
    
    func sepettenYemekSil(sepet_yemek_id: Int, kullanici_adi: String) {
        frepo.sepettenYemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
        
    }
    
    func sepettekiYemekleriGoruntule(kullanici_adi: String) {
        frepo.sepettekiYemekleriGoruntule(kullanici_adi: kullanici_adi)
    }
    
    func increaseFoodCount() {
        frepo.increaseFoodCount()
    }
    
    func decreaseFoodCount() {
        frepo.decreaseFoodCount()
    }
    
    func calculatePrice(price: Int) {
        frepo.calculatePrice(price: price)
    }

    
}
