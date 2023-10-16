//
//  HomePageViewModel.swift
//  FoodStore
//
//  Created by Musti on 6.10.2023.
//

import Foundation
import RxSwift
import UIKit

class HomePageViewModel {
    var frepo = FoodStoreDaoRepository()
    var yemekListesi = BehaviorSubject<[FoodsModel]>(value: [FoodsModel]())
    
    init(){
        yemekListesi = frepo.foodsList
    }
    
    func yemekleriListele(){
        frepo.yemekleriListele()
    }
    
    func yemekResminiYukle(yemekAdi: String, completion: @escaping (UIImage?) -> Void) {
            frepo.yemekResminiGetir(yemekAdi: yemekAdi) { image in
                completion(image)
            }
        }
    
    func sepeteYemekEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_sayisi: Int, kullanici_adi: String ) {
        frepo.sepeteYemekEkle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_sayisi: yemek_siparis_sayisi, kullanici_adi: kullanici_adi)
    }
    
    func yemekDetaylarıGoster(){
        
    }
    
}
