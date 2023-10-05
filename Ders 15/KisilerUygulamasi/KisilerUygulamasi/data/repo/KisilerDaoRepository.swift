//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 26.09.2023.
//

import Foundation
import RxSwift
import FirebaseFirestore

class KisilerDaoRepository {//Dao : Database Access Object
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    var collectionKisiler = Firestore.firestore().collection("Kisiler")
    
    func kaydet(kisi_ad:String,kisi_tel:String){
        let yeniKisi:[String:Any] = ["kisi_id":"","kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
        collectionKisiler.document().setData(yeniKisi)
    }
    
    func guncelle(kisi_id:String,kisi_ad:String,kisi_tel:String){
        print("Kişi Güncelle : \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
    
    func ara(aramaKelimesi:String){
        print("Kişi Ara : \(aramaKelimesi)")
    }
    
    func sil(kisi_id:String){
        print("Kişi Sil : \(kisi_id)")
    }
    
    func kisileriYukle(){
        collectionKisiler.addSnapshotListener{ snapshot,error in
            var liste = [Kisiler]()
            
            if let documents = snapshot?.documents {
                for document in documents {
                    let data = document.data()
                    
                    let kisi_id = document.documentID
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                    liste.append(kisi)
                }
            }
            
            self.kisilerListesi.onNext(liste)
        }
    }
}
