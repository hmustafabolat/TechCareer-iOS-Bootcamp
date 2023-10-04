//
//  GorevlerDaoRepository.swift
//  HomeWork7
//
//  Created by Musti on 3.10.2023.
//

import Foundation
import RxSwift

class GorevlerDaoRepository { //Dao: Database Access Object
    
    var gorevlerListesi = BehaviorSubject<[Gorevler]>(value: [Gorevler]())
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains (.documentDirectory,.userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath:hedefYol).appendingPathComponent("todoapp.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func kaydet(gorev_ad:String){
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO gorevler (gorev_ad) VALUES (?)", values: [gorev_ad])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func guncelle(gorev_id:Int, gorev_ad:String){
        db?.open()
        do{
            try db!.executeUpdate("UPDATE gorevler SET gorev_ad=? WHERE gorev_id=?", values: [gorev_ad, gorev_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func ara(aramaKelimesi:String){
        print("Görev ara: \(aramaKelimesi)")
    }
    
    func sil(gorev_id:Int){
        print("Görev sil: \(gorev_id)")
    }
    
    func gorevleriYukle(){
        
        
        db?.open()
        var liste = [Gorevler]()
        do{
            let rs = try db!.executeQuery("SELECT * FROM gorevler", values: nil)
            
            while rs.next(){
                let gorev_id = Int(rs.string(forColumn: "gorev_id"))!
                let gorev_ad = rs.string(forColumn: "gorev_ad")!
                
                let gorev = Gorevler(gorev_id: gorev_id, gorev_ad: gorev_ad)
                liste.append(gorev)
            }
            gorevlerListesi.onNext(liste)
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func veritabanikopyala() {
        let bundleYolu = Bundle.main.path(forResource: "todoapp", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains (.documentDirectory,.userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath:hedefYol).appendingPathComponent("todoapp.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath:
                                            kopyalanacakYer.path)
            }catch{}
        }
    }
}
