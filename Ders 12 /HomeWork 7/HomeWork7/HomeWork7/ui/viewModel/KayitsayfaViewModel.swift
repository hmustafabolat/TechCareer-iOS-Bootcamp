//
//  KayitsayfaViewModel.swift
//  HomeWork7
//
//  Created by Musti on 3.10.2023.
//

import Foundation

class KayitsayfaViewModel {
    
    var grepo = GorevlerDaoRepository()
    
    func kaydet(gorev_ad:String){
        grepo.kaydet(gorev_ad: gorev_ad)
    }
    
}
