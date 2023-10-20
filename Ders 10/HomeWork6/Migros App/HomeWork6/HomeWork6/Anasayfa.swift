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
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
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
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        tasarim.minimumLineSpacing = 20
        tasarim.minimumInteritemSpacing = 20
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 60) / 2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 0.7)
        
        kategoriCollectionView.collectionViewLayout = tasarim
        
        //Search Bar ikonları için kullanılan kodlar.
        let searchIcon = UIImageView(image: UIImage(named: "search"))
        searchIcon.contentMode = .center
        searchIcon.frame = CGRect(x: 0, y: 0, width: 30, height: 30)

        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        leftView.addSubview(searchIcon)
        searchIcon.center = leftView.center
        
        searchTextField.leftView = leftView
        searchTextField.leftViewMode = .always

        let micIcon = UIImageView(image: UIImage(named: "mic"))
        micIcon.contentMode = .center
        micIcon.frame = CGRect(x: 0, y: 0, width: 30, height: 30)

        let barcodeIcon = UIImageView(image: UIImage(named: "barcode"))
        barcodeIcon.contentMode = .center
        barcodeIcon.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        let rightView = UIStackView(arrangedSubviews: [micIcon, barcodeIcon])
        rightView.axis = .horizontal
        rightView.spacing = 10
    
        let spacerView1 = UIView()
        spacerView1.widthAnchor.constraint(equalToConstant: 20).isActive = true // Set width of spacer view
        rightView.addArrangedSubview(micIcon)
        rightView.addArrangedSubview(spacerView1)

        let spacerView2 = UIView()
        spacerView2.widthAnchor.constraint(equalToConstant: 20).isActive = true // Set width of spacer view
        rightView.addArrangedSubview(barcodeIcon)
        rightView.addArrangedSubview(spacerView2)
        
        
        let rightSpaces = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        rightSpaces.addSubview(rightView)
        rightView.center = rightSpaces.center

        searchTextField.rightView = rightSpaces
        searchTextField.rightViewMode = .always
        
    }
    
    @IBAction func searchTextField(_ sender: UITextField) {
        
    }
    
    func performSearch(){
        if let searchText = searchTextField.text{
            print("Arama: \(searchText)")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        performSearch()
        return true
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

