//
//  ViewController.swift
//  HomeWork6
//
//  Created by Musti on 27.09.2023.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var footerImage: UIImageView!
    
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var kategoriCollectionView: UICollectionView!
    
    var kategoriListesi = [Kategoriler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let apperance = UINavigationBarAppearance()
        
        apperance.backgroundColor = UIColor(named: "temaRenk1")
        apperance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk1")!, .font: UIFont(name: "plymouth-serial-heavy-regular", size: 26)!]
        
        titleImage.layer.cornerRadius = 15
        footerImage.layer.cornerRadius = 15
        
        
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        
        let k1 = Kategoriler(resim: "1")
        let k2 = Kategoriler(resim: "2")
        let k3 = Kategoriler(resim: "3")
        let k4 = Kategoriler(resim: "4")
        let k5 = Kategoriler(resim: "5")
        let k6 = Kategoriler(resim: "6")
        
        kategoriListesi.append(k1)
        kategoriListesi.append(k2)
        kategoriListesi.append(k3)
        kategoriListesi.append(k4)
        kategoriListesi.append(k5)
        kategoriListesi.append(k6)
        
        kategoriCollectionView.dataSource = self
        kategoriCollectionView.delegate = self
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumLineSpacing = 20
        tasarim.minimumInteritemSpacing = 20
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 40) / 2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 0.6)
        
        kategoriCollectionView.collectionViewLayout = tasarim
        
    }
    @IBAction func searchTextField(_ sender: UITextField) {
        
    }
}

extension Anasayfa : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kategoriListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "kategoriHucre", for: indexPath) as! KategoriHucre
        
        let kategori = kategoriListesi[indexPath.row]
        
        hucre.imageViewKategori.image = UIImage(named: kategori.resim!)
        
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.5
        hucre.layer.cornerRadius = 15
        
        return hucre
    }
    
    
}

