//
//  CartPage.swift
//  FoodStore
//
//  Created by Musti on 5.10.2023.
//

import UIKit
import Kingfisher
import RxSwift

class CartPage: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceCart: UILabel!
    
    var cartList = [CartFoodModel]()
    var viewModel = CartPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        _ = viewModel.cartList.subscribe(onNext: { cartList in
            self.cartList = cartList
            print(self.cartList.count)
            self.tableView.reloadData()
            
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.sepettekiYemekleriGoruntule(kullanici_adi: "mustafa")
    }

    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        // İlgili hücrenin indeksini al
        if let cell = sender.superview?.superview as? CartCell, let indexPath = tableView.indexPath(for: cell) {
            // Sepetten ürünü kaldır
            let yemek = cartList[indexPath.row]
            viewModel.sepettenYemekSil(sepet_yemek_id: Int(yemek.sepet_yemek_id!) ?? 0, kullanici_adi: "mustafa")
            cartList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // Ürün silindiğinde fiyat toplamını güncelleyin
            viewModel.calculatePrice(price: -Int(yemek.yemek_fiyat!)!) // Silinen ürünün fiyatını çıkarın
        }
    }

    
}

extension CartPage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "cartTableVC") as! CartCell
        let yemek = cartList[indexPath.row]
        hucre.cartFoodName.text = yemek.yemek_adi
        if let imageURL = yemek.yemek_resim_adi, let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(imageURL)") {
            hucre.cartFoodImage.kf.setImage(with: url)
        }

        hucre.cartFoodPrice.text = yemek.yemek_fiyat
        hucre.cartFoodTotalPrice.text = "\(Int(yemek.yemek_fiyat!)! * Int(yemek.yemek_siparis_adet!)!)₺"
        hucre.cartFoodPiece.text = yemek.yemek_siparis_adet
        hucre.cartDeleteButton.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        
        
        return hucre
    }
    
    
}
