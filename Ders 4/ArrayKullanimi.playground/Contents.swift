import UIKit

var numaralar = [10,20,30,40,50]
var meyveler = [String]()

//Veri ekleme
meyveler.append("Elma")     //0. indekse eklenir.
meyveler.append("Muz")      //1. indekse eklenir.
meyveler.append("Kiraz")    //2. indekse eklenir.
print(meyveler)

//Güncelleme
meyveler[0] = "Yeni Elma"
print(meyveler)

//Insert
meyveler.insert("Portakal", at: 1)
print(meyveler)

//Veri okuma
let meyve = meyveler[2]
print(meyve)

print("Boş Kontrol  : \(meyveler.isEmpty)")
print("Boyut        : \(meyveler.count)")
print("İlk eleman   : \(meyveler.first!)")
print("Son eleman   : \(meyveler.last!)")
print("İçeriyor mu  : \(meyveler.contains("Muzx"))")
print("İndeks bulma : \(meyveler.firstIndex(of: "Kiraz")!)")

for meyve in meyveler{//for each
        print("Sonuç : \(meyve)")
}

for (indeks,meyve) in meyveler.enumerated(){
    print("\(indeks). -> \(meyve)")
}

meyveler.remove(at: 1)
print(meyveler)

meyveler.removeAll()
print(meyveler)


//Nesne Tabanli Calisma

class Yemekler{
    var id:Int?
    var ad:String?
    var fiyat:Int?
    var puan:Double?
    
    init(id: Int, ad: String, fiyat: Int, puan: Double) {
        self.id = id
        self.ad = ad
        self.fiyat = fiyat
        self.puan = puan
    }
}

var y1 = Yemekler(id: 1, ad: "Köfte", fiyat: 80, puan: 4.6)
var y2 = Yemekler(id: 2, ad: "Ayran", fiyat: 30, puan: 3.8)
var y3 = Yemekler(id: 3, ad: "Tramisu", fiyat: 60, puan: 4.3)

var yemeklerListesi = [Yemekler]()
yemeklerListesi.append(y1)
yemeklerListesi.append(y2)
yemeklerListesi.append(y3)

for y in yemeklerListesi{
    print("Id: \(y.id!) - Ad: \(y.ad!) - Fiyat: \(y.fiyat!) ₺ - Puan: \(y.puan!)")
}

//Filtreleme
print("---------------Filtreleme 1-------------")
var f1 = yemeklerListesi.filter({ $0.fiyat! > 50 && $0.fiyat! < 70 })
for y in f1{
    print("Id: \(y.id!) - Ad: \(y.ad!) - Fiyat: \(y.fiyat!) ₺ - Puan: \(y.puan!)")
}

print("---------------Filtreleme 2-------------")
var f2 = yemeklerListesi.filter({ $0.ad!.contains("a") })
for y in f2{
    print("Id: \(y.id!) - Ad: \(y.ad!) - Fiyat: \(y.fiyat!) ₺ - Puan: \(y.puan!)")
}

//Sorting - Sıralama
print("---------------Fiyat : Azalan-------------")
var s1 = yemeklerListesi.sorted(by: {$0.fiyat! > $1.fiyat!})//Descending - DESC --> Büyükten küçüğe sıralama
for y in s1{
    print("Id: \(y.id!) - Ad: \(y.ad!) - Fiyat: \(y.fiyat!) ₺ - Puan: \(y.puan!)")
}

print("---------------Fiyat : Artan-------------")
var s2 = yemeklerListesi.sorted(by: {$0.fiyat! < $1.fiyat!})//Ascending - ASC --> Küçükten büyüğe sıralama
for y in s2{
    print("Id: \(y.id!) - Ad: \(y.ad!) - Fiyat: \(y.fiyat!) ₺ - Puan: \(y.puan!)")
}

print("---------------Puan : Azalan-------------")
var s3 = yemeklerListesi.sorted(by: {$0.puan! > $1.puan!})//Descending - DESC --> Büyükten küçüğe sıralama
for y in s3{
    print("Id: \(y.id!) - Ad: \(y.ad!) - Fiyat: \(y.fiyat!) ₺ - Puan: \(y.puan!)")
}

print("---------------Puan : Artan-------------")
var s4 = yemeklerListesi.sorted(by: {$0.puan! < $1.puan!})//Ascending - ASC --> Küçükten büyüğe sıralama
for y in s4{
    print("Id: \(y.id!) - Ad: \(y.ad!) - Fiyat: \(y.fiyat!) ₺ - Puan: \(y.puan!)")
}

print("---------------Ad : Azalan-------------")
var s5 = yemeklerListesi.sorted(by: {$0.ad! > $1.ad!})//Descending - DESC --> Büyükten küçüğe sıralama
for y in s5{
    print("Id: \(y.id!) - Ad: \(y.ad!) - Fiyat: \(y.fiyat!) ₺ - Puan: \(y.puan!)")
}

print("---------------Ad : Artan-------------")
var s6 = yemeklerListesi.sorted(by: {$0.ad! < $1.ad!})//Ascending - ASC --> Küçükten büyüğe sıralama
for y in s6{
    print("Id: \(y.id!) - Ad: \(y.ad!) - Fiyat: \(y.fiyat!) ₺ - Puan: \(y.puan!)")
}
