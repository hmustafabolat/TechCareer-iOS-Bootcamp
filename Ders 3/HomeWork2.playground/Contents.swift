import UIKit

//Soru 1
print("---------------------*****************************---------------------")

func celciusToFah(celsius: Double) -> Double{
    let fahrenheit = (celsius * 1.8) + 32
    return fahrenheit
}

let celsiusValue: Double = 25.0
let fahrenheitValue = celciusToFah(celsius: celsiusValue)

print("\(celsiusValue) Celsius, \(fahrenheitValue) Fahrenheit'a eşittir.")
print("---------------------*****************************---------------------")

//Soru 2

func cevreHesapla(kisaKenar:Double, uzunKenar:Double){
    let cevre = 2 * (kisaKenar + uzunKenar)
    print("Dikdörtgenin çevresi: \(cevre)")
}

cevreHesapla(kisaKenar: 10, uzunKenar: 20)
print("---------------------*****************************---------------------")

//Soru 3

func faktoriyelHesaplama(of number:Int) -> Int{
    if number == 0{
        return 1
    }
    
    var result = 1
    for i in 1...number{
        result *= i
    }
    return result
}

let num = 6
let faktoriyel = faktoriyelHesaplama(of: num)
print("Girilen sayının faktoriyeli: \(faktoriyel)")
print("---------------------*****************************---------------------")

//Soru 4

func aHarfiSayaci(in word: String) -> Int{
    var count = 0
    
    for character in word{
        if character == "a" || character == "A"{
            count += 1
        }
    }
    return count
}

let kelime = "Adana"
let aCount = aHarfiSayaci(in: kelime)
print("Girdiğiniz \(kelime) kelimesi \(aCount) tane a-A harfi bulundurmakta")
print("---------------------*****************************---------------------")

//Soru 5

func icAciToplamı(kenarSayisi: Int) -> Int{
    let icAciToplam = (kenarSayisi - 2 ) * 180
    return icAciToplam
}

let kenarSayisi = 7
let icAci = icAciToplamı(kenarSayisi: kenarSayisi)
print("\(kenarSayisi) kenarlı üçgenimizin iç açıları toplamı: \(icAci) derecedir.")
print("---------------------*****************************---------------------")


//Soru 6

func maasHesapla(gunSayisi: Int) -> Int{
    let gunlukCalismaSaati = 8
    let calismaSaatUcreti = 10
    let mesaiSaatUcreti = 20
    let mesaiSiniri = 160
    let toplamCalismaSaati = gunSayisi * calismaSaatUcreti
    
    var maas = 0
    
    if toplamCalismaSaati < mesaiSiniri{
        maas = toplamCalismaSaati * calismaSaatUcreti
    }else{
        let normalCalismaSaati = mesaiSiniri
        let mesaiSaati = toplamCalismaSaati - mesaiSiniri
        maas = normalCalismaSaati * calismaSaatUcreti + mesaiSaati
    }
    return maas
}

let gunSayisi = 30
let maas = maasHesapla(gunSayisi: gunSayisi)
print("Aldığı maaş : \(maas) ₺")
print("---------------------*****************************---------------------")


//Soru 7

func ucretHesapla(KotaGB: Int) -> Double{
    let tabanUcret: Double = 100.0
    let kotaAsimUcret: Double = 4.0
    
    if KotaGB <= 50{
        return tabanUcret
    }else{
        let fazlaGB = Double(KotaGB - 50)
        let fazlaUcret = fazlaGB * kotaAsimUcret
        let toplamUcret = tabanUcret + fazlaUcret
        return toplamUcret
    }
}

let kullanilan = 55
let ucret = ucretHesapla(KotaGB: kullanilan)
print("\(kullanilan) GB için ödenecek ücret \(ucret) ₺'dir")
print("---------------------*****************************---------------------")

