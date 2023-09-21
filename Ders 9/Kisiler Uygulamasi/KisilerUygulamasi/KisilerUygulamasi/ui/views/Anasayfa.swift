//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Musti on 21.09.2023.
//

import UIKit

class Anasayfa: UIViewController{
    
    @IBOutlet weak var kisilerTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var kisilerListesi = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self //anasayfa -> UISearchBarDelegate
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "11111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Mehmet", kisi_tel: "2222")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Ali", kisi_tel: "3333")
        let k4 = Kisiler(kisi_id: 4, kisi_ad: "Zeynep", kisi_tel: "44444")
        kisilerListesi.append(k1)//0.
        kisilerListesi.append(k2)//1.
        kisilerListesi.append(k3)//2.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfaya dönüldü")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
            let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
        }
    }
    
    
}

extension Anasayfa : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişi Ara : \(searchText)")
    }
}

extension Anasayfa : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        
        let kisi = kisilerListesi[indexPath.row]
        
        hucre.labelKisiAd.text = kisi.kisi_ad
        hucre.labelKisiTel.text = kisi.kisi_tel
        return hucre
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ contextualAction, view, bool in
            let kisi = self.kisilerListesi[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){
                action in
                print("Kişi sil: \(kisi.kisi_ad!)")
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
            
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
