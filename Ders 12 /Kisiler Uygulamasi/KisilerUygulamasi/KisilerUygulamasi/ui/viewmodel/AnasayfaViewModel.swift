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
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())

    init(){
        kisilerListesi = krepo.kisilerListesi
    }
    
    func ara(aramaKelimesi:String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(kisi_id:Int){
        krepo.sil(kisi_id: kisi_id)
        //Sildiktan sonra güncelleme için bu yapılır.
        kisileriYukle()
    }
    
    func kisileriYukle(){
        krepo.kisileriYukle()
    }
}
