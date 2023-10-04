//
//  AnasayfaViewModel.swift
//  HomeWork7
//
//  Created by Musti on 3.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var grepo = GorevlerDaoRepository()
    var gorevlerListesi = BehaviorSubject<[Gorevler]>(value: [Gorevler]())
    
    init(){
        grepo.veritabanikopyala()
        gorevlerListesi = grepo.gorevlerListesi
    }
    
    func ara(aramaKelimesi:String){
        grepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(gorev_id:Int){
        grepo.sil(gorev_id: gorev_id)
        gorevleriYukle()
    }
    
    func gorevleriYukle(){
        grepo.gorevleriYukle()
    }
}
