import UIKit

//Guard = if'in tersi
//Fonksiyon içinde çalışması gereklidir.

func kisiTanima1(ad:String){
    if ad == "Ahmet"{
        print("Merhaba Ahmet")
    }else{
        print("Tanınmayan Kişi")
    }
}

kisiTanima1(ad: "Ahmetx")


func kisiTanima2(ad:String){
    guard ad == "Ahmet" else {
        print("Tanınmayan Kişi")
        return
    }
    print("Merhaba Ahmet")
}

kisiTanima2(ad: "Ahmet")



//Try catch
//Compile Error
let sayi = 10
//sayi = 50

//2.Runtime error: Exception

enum Hatalar:Error{
    case sifiraBolunmeHatasi
}

func bolme(sayi1:Int, sayi2:Int) throws -> Int{
    if sayi2 == 0{
        throw Hatalar.sifiraBolunmeHatasi
    }
    return sayi1 / sayi2
}
do{
    let sonuc = try bolme(sayi1: 10, sayi2: 0)
    print(sonuc)
}catch{
    print("Hata oluştu.")
}

let sonuc1 = try? bolme(sayi1: 10, sayi2: 5)
if let temp = sonuc1{
    print(temp)
}else{
    print("Hata oluştu")
}
