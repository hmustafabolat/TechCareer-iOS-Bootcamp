//
//  homeCollectionVC.swift
//  FoodStore
//
//  Created by Musti on 6.10.2023.
//

import UIKit

protocol HucreProtocol{
    func sepeteEkleTikla(indexPath:IndexPath)
}

class YemeklerCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var addCartButton: UIButton!
    
    
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
}
