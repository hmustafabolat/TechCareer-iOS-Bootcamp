import UIKit

//Karşılaştırma Operatörleri

var a = 40
var b = 50

var x = 90
var y = 80

print("a == b : \(a == b)")
print("a != b : \(a != b)")
print("a > b : \(a > b)")
print("a >= b : \(a >= b)")
print("a < b : \(a < b)")
print("a <= b : \(a <= b)")

print("a > b || x > y : \(a > b || x > y)") //OR - Veya operatörü

print("a > b && x > y : \(a > b && x > y)") //AND - Ve operatörü


//if kullanımı

var yas = 19
var isim = "Mehmet"

if yas >= 18 {
    print("Reşitsiniz")
}else{
    print("Reşit değilsiniz.")
}

if isim == "Ahmet"{
    print("Merhaba Ahmet")
}else if isim == "Mehmet"{
    print("Merhaba Mehmet")
}
else{
    print("Tanınmayan kişi")
}


var ka = "admin"
var s = 12345

if ka == "admin" && s == 12345{
    print("Hoşgeldiniz")
}else{
    print("Hatalı Giriş")
}

var sonuc = 30

if sonuc == 10 || sonuc == 20{
    print("Sonuç 10 veya 20'dir")
}else{
    print("Sonuç 10 veya 20 değildir")
}

var z = 10
var t = 20

z == t ? print("Eşit") : print("Eşit değil")

//Switch

var gun = 3

switch gun{
case 1: print("Pazartesi")
case 2: print("Salı")
case 3: print("Çarşamba")
case 4: print("Perşembe")
case 5: print("Cuma")
case 6: print("Cumartesi")
case 7: print("Pazar")
default: print("Böyle bir gün yok")
}


//Loop - Döngüler

for k in 1...3 {
    print("Döngü 1: \(k)")
}

//Belirli aralıklarda döngü çalıştırma.
for i in stride(from: 10, through: 20, by: 5){
    print("Döngü 2: \(i)")
}

for i in stride(from: 20, through: 10, by: -5){
    print("Döngü 3: \(i)")
}


//While döngüsü

var sayac = 1

while sayac < 4{
    print("Döngü 4 : \(sayac)")
    sayac += 1
}

//3'e gelindiğinde duruyor program.
for i in 1...5{
    if i == 3{
        break
    }
    print("Döngü 5: \(i)")
}

//Continue'da pas geçme işlemi oluyor, eşit olan değer pas geçiliyor.
for i in 1...5{
    if i == 3{
        continue
    }
    print("Döngü 6: \(i)")
}

