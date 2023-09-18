import UIKit

class Ev {
    var pencereSayisi: Int?
    
    init(pencereSayisi: Int) {
        self.pencereSayisi = pencereSayisi
    }
}

class Saray: Ev {
    var kuleSayisi: Int?
    
    init(kuleSayisi: Int, pencereSayisi: Int) {
        self.kuleSayisi = kuleSayisi
        super.init(pencereSayisi: pencereSayisi)
    }
}

class Villa: Ev {
    var garajVarmi: Bool?
    
    init(garajVarmi: Bool, pencereSayisi: Int) {
        self.garajVarmi = garajVarmi
        super.init(pencereSayisi: pencereSayisi)
    }
}

let topkapiSarayi = Saray(kuleSayisi: 5, pencereSayisi: 300)
let bogazVilla = Villa(garajVarmi: true, pencereSayisi: 50)

print(topkapiSarayi.kuleSayisi!)
print(topkapiSarayi.pencereSayisi!)


print(bogazVilla.garajVarmi!)
print(bogazVilla.pencereSayisi!)

//MARK: - Upcasting
//saraydan eve dönüşüm

let ev = Saray(kuleSayisi: 3, pencereSayisi: 100) as Ev

//MARK: - Downcasting
let saray = Ev(pencereSayisi: 40) as? Saray

//MARK: - Tip kontrolü
if ev is Ev {
    print("Nesne ev sınıfından türetilmiştir")
}else {
    print("Nesne ev sınıfından türetilmemiştir")
}

//MARK: - Override Kullanımı
class Hayvan {
    func sesCikar() {
        print("Sesim yok")
    }
}

class Memeli: Hayvan {
    
}

class Kedi: Memeli {
    override func sesCikar() {
        print("Miyav")
    }
}

class Kopek: Memeli {
    override func sesCikar() {
        print("Hav")
    }
}

let hayvan = Hayvan()
let memeli = Memeli()
let kedi = Kedi()
let kopek = Kopek()

hayvan.sesCikar() //Kalıtım yok, kendi metoduna erişti
memeli.sesCikar() //Kalıtım var, üst sınıfın metoduna erişti
kedi.sesCikar() //Kalıtım var, kendi metoduna erişti
kopek.sesCikar()    //Kalıtım var, kendi metoduna erişti


//Protocol - Interface
protocol MyProtocol{
    var degisken: Int { get set } //Get değer atamak, set ise okumak için kullanılır.
    
    func metod1()
    func metod2() -> String
}

class ClassA: MyProtocol{
    var degisken: Int = 10
    
    func metod1() {
        print("Metod 1 Çalıştı.")
    }
    
    func metod2() -> String {
        return("Metod 2 Çalıştı.")
    }
}

let classA = ClassA()
print(classA.degisken)
classA.metod1()
print(classA.metod2())

//Extension

extension Int{
    func carp(sayi:Int) -> Int{
        return self * sayi
    }
}

let sonuc = 5.carp(sayi: 3)
print("Sonuç: \(sonuc)")


//Closure

