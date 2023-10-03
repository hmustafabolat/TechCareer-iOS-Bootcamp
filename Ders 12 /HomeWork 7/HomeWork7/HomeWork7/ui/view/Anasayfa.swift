//
//  ViewController.swift
//  HomeWork7
//
//  Created by Musti on 3.10.2023.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var gorevlerTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var gorevlerListesi = [Gorevler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        gorevlerTableView.delegate = self
        gorevlerTableView.dataSource = self
        
        let g1 = Gorevler(gorev_id: 1, gorev_ad: "Görev 1")
        let g2 = Gorevler(gorev_id: 2, gorev_ad: "Görev 2")
        let g3 = Gorevler(gorev_id: 3, gorev_ad: "Görev 3")
        let g4 = Gorevler(gorev_id: 4, gorev_ad: "Görev 4")
        let g5 = Gorevler(gorev_id: 5, gorev_ad: "Görev 5")
        
        gorevlerListesi.append(g1)
        gorevlerListesi.append(g2)
        gorevlerListesi.append(g3)
        gorevlerListesi.append(g4)
        gorevlerListesi.append(g5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfaya Dönüldü")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let gorev = sender as? Gorevler{
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.gorev = gorev
            }
        }
    }


}

extension Anasayfa : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişi Ara: \(searchText)")
    }
}

extension Anasayfa : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gorevlerListesi.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "gorevlerHucre") as! GorevlerHucre
        
        let gorev = gorevlerListesi[indexPath.row]
        
        hucre.labelGorevAd.text = gorev.gorev_ad
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gorev = gorevlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: gorev)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ contextualAction, view, bool in
            let gorev = self.gorevlerListesi[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(gorev.gorev_ad!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){
                action in
                print("Kişi sil: \(gorev.gorev_ad!)")
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
            
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
}
