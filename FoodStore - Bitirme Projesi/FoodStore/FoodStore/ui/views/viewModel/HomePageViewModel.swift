//
//  HomePageViewModel.swift
//  FoodStore
//
//  Created by Musti on 6.10.2023.
//

import Foundation
import RxSwift

class HomePageViewModel {
    var frepo = FoodStoreDaoRepository()
    var yemekListesi = BehaviorSubject<[Yemekler]>(value: [Yemekler]())
    
    init(){
        yemekListesi = frepo.yemeklerListesi
    }
    
    func yemekleriListele(){
        
    }
    
    func yemekAra(){
        
    }
    
    func yemekDetaylarıGoster(){
        
    }
    
    
    
}
