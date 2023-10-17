//
//  FoodStoreDaoRepository.swift
//  FoodStore
//
//  Created by Musti on 6.10.2023.
//

import Foundation
import RxSwift
import Alamofire
import UIKit


class FoodStoreDaoRepository {
    
    var foodsList =  BehaviorSubject<[FoodsModel]>(value: [FoodsModel]())
    var cartList = BehaviorSubject<[CartFoodModel]>(value: [CartFoodModel]())
    var foodCount = BehaviorSubject<Int>(value: 1)
    var totalPrice = BehaviorSubject<Int>(value: 0)
    
    //http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php
    
    init(){
        
    }
    
    func yemekleriListele(){
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")
        AF.request(url!, method: .get).response { response in
            if let data = response.data {
                do{
                    let dataResponse = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    if let list = dataResponse.yemekler {
                        self.foodsList.onNext(list)
                }
            }catch{
                print(error.localizedDescription)
                }
            }
        }
    }
    
    func yemekResminiGetir(yemekAdi: String, completion: @escaping (UIImage?) -> Void) {
            let baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler/"
            let imageUrlString = baseUrl + yemekAdi
            
            guard let imageUrl = URL(string: imageUrlString) else {
                print("Geçersiz resim URL'si")
                completion(nil)
                return
            }
            
            AF.request(imageUrl).responseData { response in
                if let data = response.data, let image = UIImage(data: data) {
                    completion(image)
                } else {
                    print("Resim indirme hatası: \(response.error?.localizedDescription ?? "Bilinmeyen hata")")
                    completion(nil)
                }
            }
        }
    
    
    func sepeteYemekEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_sayisi: Int, kullanici_adi: String){
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php")
        let params:Parameters = ["yemek_adi":yemek_adi, "yemek_resim_adi":yemek_resim_adi, "yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_sayisi, "kullanici_adi":kullanici_adi]
        
        AF.request(url!, method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let dataResponse = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("------- Sepete Yemek Ekle -------")
                    print("Başarı : \(dataResponse.success!)")
                    print("Mesaj : \(dataResponse.message!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func sepettekiYemekleriGoruntule(kullanici_adi : String){
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php")
        let params:Parameters = ["kullanici_adi" : kullanici_adi]
        
        AF.request(url!, method: .post, parameters: params).response {response in
            if let data = response.data{
                do {
                    //let rawResponse = try JSONSerialization.jsonObject(with: data)
                    //print(rawResponse)
                    let dataResponse = try JSONDecoder().decode(CartFoodResponse.self, from: data)
                    if let list = dataResponse.sepet_yemekler {
                        self.cartList.onNext(list)
                        print(list.count)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func sepettenYemekSil(sepet_yemek_id: Int, kullanici_adi: String){
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php")
        let params:Parameters = ["sepet_yemek_id": sepet_yemek_id, "kullanici_adi": kullanici_adi]
        
        AF.request(url!, method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let dataResponse = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("------- Sepetten Yemek Sil -------")
                    print("Başarı : \(dataResponse.success!)")
                    print("Mesaj : \(dataResponse.message!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func increaseFoodCount() {
        let newCount = (try? foodCount.value()) ?? 1
        foodCount.onNext(newCount + 1)
    }
    
    func decreaseFoodCount() {
        let currentCount = (try? foodCount.value()) ?? 1
        let newCount = max(currentCount - 1, 1)
        foodCount.onNext(newCount)
    }
    
    func calculatePrice(price: Int) {
        let currentCount = (try? foodCount.value()) ?? 1
        let newTotalPrice = Int(currentCount) * price
        totalPrice.onNext(newTotalPrice)
    }
    
    
    
}
