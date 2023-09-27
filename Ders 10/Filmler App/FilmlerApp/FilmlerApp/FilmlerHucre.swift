//
//  FilmlerHucre.swift
//  FilmlerApp
//
//  Created by Musti on 27.09.2023.
//

import UIKit

protocol HucreProtocol{
    func sepeteEkleTikla(indexPath:IndexPath)
}

class FilmlerHucre: UICollectionViewCell {
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        hucreProtocol?.sepeteEkleTikla(indexPath: indexPath!)
    }
    
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var imageViewFilm: UIImageView!
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
}
