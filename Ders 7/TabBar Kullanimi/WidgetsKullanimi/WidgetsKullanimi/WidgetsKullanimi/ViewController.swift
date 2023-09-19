//
//  ViewController.swift
//  WidgetsKullanimi
//
//  Created by Musti on 17.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelSonuc: UILabel!
    
    @IBOutlet weak var textFieldGirdi: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mSwitch: UISwitch!
    
    @IBOutlet weak var labelSwitch: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var labelSegmented: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var labelSlider: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var labelStepper: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if mSwitch.isOn{
            labelSwitch.text = "Açık"
        }else{
            labelSwitch.text = "Kapalı"
        }
        
        let secilenIndeks = segmentedControl.selectedSegmentIndex
        let secilenKategori = segmentedControl.titleForSegment(at: secilenIndeks)
        labelSegmented.text = "Seçim: \(secilenKategori!)"
    }

    @IBAction func buttonMutlu(_ sender: Any) {
        imageView.image = UIImage(named: "mutlu_resim")
    }
    
    @IBAction func buttonUzgun(_ sender: Any) {
        imageView.image = UIImage(named: "uzgun_resim")
    }
    
    @IBAction func buttonOku(_ sender: Any) {
        if let alinanVeri = textFieldGirdi.text{
            labelSonuc.text = alinanVeri
        }
    }
    
    @IBAction func segmentedDegisim(_ sender: UISegmentedControl) {
        let secilenIndeks = sender.selectedSegmentIndex
        let secilenKategori = sender.titleForSegment(at: secilenIndeks)
        labelSegmented.text = "Seçim: \(secilenKategori!)"
    }
    
    @IBAction func sliderDegisim(_ sender: UISlider) {
        labelSlider.text = String(Int(sender.value))
    }
    
    @IBAction func stepperDegisim(_ sender: Any) {
    }
    
    @IBAction func buttonGoster(_ sender: Any) {
        print("Switch Durum: \(mSwitch.isOn)")
        let secilenIndeks = segmentedControl.selectedSegmentIndex
        let secilenKategori = segmentedControl.titleForSegment(at: secilenIndeks)
        print("Seçilen : \(secilenIndeks)")
        print("Seçilen : \(secilenKategori!)")
        print("Slider : \(slider.value)")
    }
    
    @IBAction func switchDegisim(_ sender: UISwitch) {
        if sender.isOn{
            labelSwitch.text = "Açık"
        }else{
            labelSwitch.text = "Kapalı"
        }
    }
    
    
    
    
}

