//
//  CartPageViewModel.swift
//  FoodStore
//
//  Created by Musti on 6.10.2023.
//

import Foundation
import RxSwift

class CartPageViewModel{
    var frepo = FoodStoreDaoRepository()
    var cartList = BehaviorSubject<[CartFoodModel]>(value: [CartFoodModel]())
    var foodPrice = BehaviorSubject<Int>(value: 0)
    var foodCount = BehaviorSubject<Int>(value: 1)
    
    init(){
        cartList = frepo.cartList
        foodCount = frepo.foodCount
        foodPrice = frepo.totalPrice
    }
    
    func sepettekiYemekleriGoruntule(kullanici_adi:String){
        frepo.sepettekiYemekleriGoruntule(kullanici_adi: kullanici_adi)
    }
    
    func sepettenYemekSil(sepet_yemek_id: Int, kullanici_adi: String){
        frepo.sepettenYemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
    func calculatePrice(price: Int) {
        frepo.calculatePrice(price: price)
    }
}
