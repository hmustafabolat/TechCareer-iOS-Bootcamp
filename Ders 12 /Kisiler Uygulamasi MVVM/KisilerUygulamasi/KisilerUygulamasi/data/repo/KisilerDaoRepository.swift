//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Musti on 26.09.2023.
//

import Foundation
import RxSwift
import CoreData


class KisilerDaoRepository {//Dao: Database Access Object 
    
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    
    let context = appDelegate.persistentContainer.viewContext
    
    func kaydet(kisi_ad:String, kisi_tel:String){
        
    }
    
    func guncelle(kisi:KisilerModel, kisi_ad:String, kisi_tel:String){
        
    }
    
    func ara(aramaKelimesi:String){
        
    }
    
    func sil(kisi:KisilerModel){
        
    }
    
    func kisileriYukle(){
        
        //kisilerListesi.onNext(liste)
    }
}
