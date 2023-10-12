//
//  FoodStoreDaoRepository.swift
//  FoodStore
//
//  Created by Musti on 6.10.2023.
//

import Foundation
import RxSwift
import Alamofire

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
                        
                        print("\(list.count)***")
                }
            }catch{
                print(error.localizedDescription)
                }
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
