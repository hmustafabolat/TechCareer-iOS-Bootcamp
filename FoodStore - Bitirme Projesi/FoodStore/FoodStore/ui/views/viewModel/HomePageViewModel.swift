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
    var yemekListesi = BehaviorSubject<[Yemekler]>(value: [Yemekler]())
    
    init(){
        yemekListesi = frepo.yemeklerListesi
    }
    
    func yemekleriListele(){
        frepo.yemekleriListele()
    }
    
    func yemekResminiYukle(yemekAdi: String, completion: @escaping (UIImage?) -> Void) {
            frepo.yemekResminiGetir(yemekAdi: yemekAdi) { image in
                completion(image)
            }
        }
    
    
    func yemekAra(aramaKelimesi: String){
        frepo.yemekAra(aramaKelimesi: aramaKelimesi)
    }
    
    func yemekDetaylarıGoster(){
        
    }
    
}
