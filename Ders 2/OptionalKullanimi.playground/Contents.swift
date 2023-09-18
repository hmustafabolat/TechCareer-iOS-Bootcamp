import UIKit

//Optional - Nulable - Null Safety
//nil, null, NaN
//?, !

var str = "Hello"

//Tanımlama
var mesaj:String?

mesaj = "merhaba "

if mesaj != nil{
    print(mesaj!)
}else{
    print("Mesaj nil'dir.")
}

//Optional binding = if let yapısı

if let temp = mesaj{//nil ise false, nil değilse true
    print(temp)//otomatik unwrapped
}else{
    print("Mesaj nil'dir.")
}


if var temp = mesaj{//nil ise false, nil değilse true
    print(temp)//otomatik unwrapped
    temp = "Nasılsın"
    print(temp)
}else{
    print("Mesaj nil'dir.")
}

