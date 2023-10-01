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
        var liste = [Kisiler]()
        let k1 = Kisiler(kisi_id: "1", kisi_ad: "Ahmet", kisi_tel: "1111")
        let k2 = Kisiler(kisi_id: "2", kisi_ad: "Zeynep", kisi_tel: "2222")
        let k3 = Kisiler(kisi_id: "3", kisi_ad: "Beyaz", kisi_tel: "3333")
        
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        kisilerListesi.onNext(liste)
    }
}
