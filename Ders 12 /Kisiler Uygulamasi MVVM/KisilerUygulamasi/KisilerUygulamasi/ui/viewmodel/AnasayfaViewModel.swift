//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Musti on 26.09.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var krepo = KisilerDaoRepository()
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())

    init(){
        kisilerListesi = krepo.kisilerListesi
    }
    
    func ara(aramaKelimesi:String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(kisi:KisilerModel){
        krepo.sil(kisi:kisi)
        //Sildiktan sonra güncelleme için bu yapılır.
        kisileriYukle()
    }
    
    func kisileriYukle(){
        krepo.kisileriYukle()
    }
}
