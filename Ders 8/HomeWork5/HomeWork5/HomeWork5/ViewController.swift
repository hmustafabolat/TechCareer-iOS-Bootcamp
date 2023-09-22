//
//  ViewController.swift
//  HomeWork5
//
//  Created by Musti on 21.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hesaplananToplananlar: UILabel!
    var girilenSayilar = ""
    
    @IBOutlet weak var hesaplananSonuc: UILabel!
    var sonuc:Double = 0.0
    
    @IBOutlet weak var buttonToplama: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toplamaButtonKapali()
    }
    
    @IBAction func resetResult(_ sender: UIButton) {
        clearInput()
        toplamaButtonKapali()
    }
    
    @IBAction func buttonToplama(_ sender: UIButton) {
        if !girilenSayilar.isEmpty && !girilenSayilar.hasSuffix("+") {
                girilenSayilar += "+"
                hesaplananToplananlar.text = girilenSayilar
            }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if let buttonText = sender.titleLabel?.text, buttonText != "."{
            if let number = Double(buttonText){
                girilenSayilar += buttonText
                hesaplananToplananlar.text = girilenSayilar
                toplamaButtonAcik()
            }
        }
        else if let buttonTextSifir = sender.titleLabel?.text, buttonTextSifir == "." && !girilenSayilar.contains("."){
            girilenSayilar += (sender.titleLabel?.text)!
            hesaplananToplananlar.text = girilenSayilar
            toplamaButtonAcik()
        }
    }
    @IBAction func buttonEsittir(_ sender: Any) {
        if !girilenSayilar.isEmpty{
            let components = girilenSayilar.components(separatedBy: "+")
            var total:Double = 0.0
            
            for component in components {
                if let number = Double(component){
                    total += number
                }
            }
            
            sonuc = total
            hesaplananSonuc.text = "\(sonuc)"
            toplamaButtonAcik()
        }
    }
    
    func clearInput(){
        girilenSayilar = ""
        hesaplananToplananlar.text = ""
        sonuc = 0.0
        hesaplananSonuc.text = "0"
    }
    
    func toplamaButtonKapali(){
        buttonToplama.isEnabled = false
    }
    
    func toplamaButtonAcik(){
        buttonToplama.isEnabled = true
    }

}

