import UIKit

var ogrenciAdi = "Ahmet"
var ogrenciYas = 15
var ogrenciBoy = 1.78
var ogrenciBasharf = "A"
var ogrenciDevamEdiyorMu = true

print(ogrenciAdi)
print(ogrenciYas)
print(ogrenciBoy)
print(ogrenciBasharf)
print(ogrenciDevamEdiyorMu)

var urun_id : Int = 3416
var urun_adi : String = "Kol Saati"
var urun_adet : Int = 100
var urun_fiyat : Double = 149.99
var urun_tedarikci : String = "Rolex"

print("Ürün ID: \(urun_id)")
print("Ürün Adı: \(urun_adi)")
print("Ürün Adeti: \(urun_adet)")
print("Ürün Fiyat: \(urun_fiyat) ₺")
print("Ürün Tedarikçi: \(urun_tedarikci)")

//Constant - Sabit
//let keyword
var sayi = 10
print(sayi)
sayi = 100
print(sayi)


//Burada bu kod çalışmayacaktır. let ile sabit olduğunu belirtip daha sonra değiştirmek istiyoruz fakat sabit olacağı için değiştirmiyor.
/*
let numara = 20
print(numara)
numara = 343
print(numara)
*/

//Tür Dönüşümü - Type Casting

//Sayısaldan Sayısala
var i = 42
var d = 56.78

var sonuc1 = Double(i)
var sonuc2 = Int(d)

print(sonuc1)
print(sonuc2)

//Sayısaldan Metine

var sonuc3 = String(i)
var sonuc4 = String(d)
print(sonuc3)
print(sonuc4)

//Metinden Sayısala

var yazi = "34"

if let sonuc5 = Int(yazi){
    print(sonuc5)
}else{
    print("Dönüşüm hatası")
}
