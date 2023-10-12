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
    
    var yemeklerListesi =  BehaviorSubject<[Yemekler]>(value: [Yemekler]())
    var sepetListesi = BehaviorSubject<[SepettekiYemekler]>(value: [SepettekiYemekler]())
    //http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php
    
    func yemekleriListele(){
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")
        AF.request(url!, method: .get).response { response in
            if let data = response.data {
                do{
                    let dataResponse = try JSONDecoder().decode(YemeklerResponse.self, from: data)
                    if let list = dataResponse.yemekler {
                        self.yemeklerListesi.onNext(list)
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
    
    
    
    func yemekDetaylarıGoster(){
        
    }
    
    func detaydaAdetSec(){
        
    }
    
    func sepeteYemekEkle(){
        
    }
    
    func sepettekiYemekleriGoruntule(){
        
    }
    
    func sepettenYemekSil(){
        
    }
    
    func yemekAra(aramaKelimesi:String){
        
    }
    
    
}
