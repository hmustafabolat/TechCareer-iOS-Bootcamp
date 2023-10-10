//
//  DetailPage.swift
//  FoodStore
//
//  Created by Musti on 10.10.2023.
//

import UIKit

class DetailPage: UIViewController {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var foodAbout: UILabel!
    @IBOutlet weak var foodDescription: UILabel!

    var yemek:Yemekler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let y = yemek{
            foodImage.image = UIImage(named: y.yemek_resim_adi!)
            foodName.text = y.yemek_adi
            foodPrice.text = y.yemek_fiyat

            
        }
    }
    
    @IBAction func addToCartButton(_ sender: Any) {
        
    }
    
    @IBAction func minusButton(_ sender: Any) {
        
    }
    
    @IBAction func plusButton(_ sender: Any) {
        
    }
    
}
