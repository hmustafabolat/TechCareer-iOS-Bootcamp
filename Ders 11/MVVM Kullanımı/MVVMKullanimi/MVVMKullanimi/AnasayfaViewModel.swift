//
//  AnasayfaViewModel.swift
//  MVVMKullanimi
//
//  Created by Musti on 26.09.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var sonuc = BehaviorSubject <String>(value: "0") //Tanımlama
    var mrepo = MatematikRepository()
    
    init(){
        sonuc = mrepo.sonuc//Bağlantı
    }
    
    func topla(alinanSayi1:String, alinanSayi2:String){
        mrepo.topla(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    
    func carp(alinanSayi1:String, alinanSayi2:String){
        mrepo.carp(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
}
