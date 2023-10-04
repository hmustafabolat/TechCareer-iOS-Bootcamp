//
//  DetaysayfaViewModel.swift
//  HomeWork7
//
//  Created by Musti on 3.10.2023.
//

import Foundation

class DetaysayfaViewModel {
    
    var grepo = GorevlerDaoRepository()
    
    func guncelle(gorev_id:Int, gorev_ad:String){
        grepo.guncelle(gorev_id: gorev_id, gorev_ad: gorev_ad)
    }
}
