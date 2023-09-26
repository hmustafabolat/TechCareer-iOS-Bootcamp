//
//  UrunlerHucre.swift
//  UrunlerApp
//
//  Created by Musti on 26.09.2023.
//

import UIKit

class UrunlerHucre: UITableViewCell {
    @IBOutlet weak var arkaplan: UIView!
    @IBOutlet weak var imageViewUrun: UIImageView!
    
    @IBOutlet weak var labelUrunFiyat: UILabel!
    @IBOutlet weak var labelUrunAd: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    @IBAction func buttonSepeteEkle(_ sender: Any) {
    }
    
}
