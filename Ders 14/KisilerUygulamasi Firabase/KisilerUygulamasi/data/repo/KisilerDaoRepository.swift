//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 26.09.2023.
//

import Foundation
import RxSwift

class KisilerDaoRepository {//Dao : Database Access Object
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func kaydet(kisi_ad:String,kisi_tel:String){
        print("Kişi Kaydet : \(kisi_ad) - \(kisi_tel)")
    }
    
    func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){
        print("Kişi Güncelle : \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
    
    func ara(aramaKelimesi:String){
        print("Kişi Ara : \(aramaKelimesi)")
    }
    
    func sil(kisi_id:Int){
        print("Kişi Sil : \(kisi_id)")
    }
    
    func kisileriYukle(){
        var liste = [Kisiler]()
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Zeynep", kisi_tel: "2222")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Beyza", kisi_tel: "3333")
        liste.append(k1)//0.
        liste.append(k2)//1.
        liste.append(k3)//2.
        kisilerListesi.onNext(liste)
    }
}
