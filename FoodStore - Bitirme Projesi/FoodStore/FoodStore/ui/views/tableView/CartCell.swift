//
//  CartCell.swift
//  FoodStore
//
//  Created by Musti on 16.10.2023.
//

import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet weak var cartFoodImage: UIImageView!
    @IBOutlet weak var cartFoodName: UILabel!
    @IBOutlet weak var cartFoodPrice: UILabel!
    @IBOutlet weak var cartFoodPiece: UILabel!
    @IBOutlet weak var cartButtonDelete: UIButton!
    @IBOutlet weak var cartFoodTotalPrice: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
