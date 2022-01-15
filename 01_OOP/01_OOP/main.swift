//
//  main.swift
//  01_OOP
//
//  Created by Dogukan Berk Ozer on 5.01.2022.
//

import Foundation

//Bir öğrenci uygulama modelinin oluşturulması
//Ad, soyad, numara ve aldığı dersler bulunan öğrenciler vardır.
//Öğrencilerin derslerinin vize ve final notları olabilir.
//Öğrencinin derslerinin not ortalaması hesaplanabilir.
//Öğrencinin sınıf geçme durumu hesaplanabilir. Tüm derslerin aritmetik ortalaması 40 ın altındaysa kalır. Üstündeyse geçer.

class Student
{
    let name : String
    let lastName : String
    let no : Int
    var lectures : [Lecture]

    init(name : String, lastName : String, no : Int, lectures : [Lecture])
    {
        self.name = name
        self.lastName = lastName
        self.no = no
        self.lectures = lectures
    }
}

class Lecture
{
    var visaGrade : Int!
    var finalGrade : Int!

    init(visaGrade : Int, finalGrade : Int)
    {
        self.visaGrade = visaGrade
        self.finalGrade = finalGrade
    }
}

func calculateLecGrade(lec : Lecture) -> Double
{
    let avg = (Double(lec.visaGrade) * 0.5) + (Double(lec.finalGrade) * 0.5)
    return avg
}

func isPassed(student : Student) -> String
{
    var lastAvg : Double = 0.0

    for i in student.lectures
    {
        lastAvg += Double(calculateLecGrade(lec: i))
    }

    lastAvg = lastAvg / Double(student.lectures.count)

    if(lastAvg >= 40)
    {
        return "\(student.name) passed the year, congrats 🥳"
    }
    else
    {
        return "\(student.name) failed this year ⛔️"
    }
}

var lec1 = Lecture(visaGrade: 30, finalGrade: 30)
var lec2 = Lecture(visaGrade: 70, finalGrade: 70)
var lec3 = Lecture(visaGrade: 40, finalGrade: 40)

var dogukan = Student(name: "dogukan", lastName: "ozer", no: 82, lectures: [lec1, lec2])
var berk = Student(name: "berk", lastName: "ozer", no: 87, lectures: [lec1, lec3])

print(isPassed(student: dogukan))
print(isPassed(student: berk))





//- Bir e-ticaret sisteminde kullanılacak ürün ve kategori sistemi modellenecektir.
//- Kategorilerin ad ve üst kategori bilgisi bulunacaktır.
//- Ürünlerin marka, ad, kısa açıklama, detay açıklama, fiyat bilgileri bulunacaktır.
//- Markaların sadece ad bilgisi olabilecektir.
//- Ürünlerin birden fazla kategorisi bulunabilir.

class Category
{
    var name : String!
    var upperCategory : Category?

    init(name : String)
    {
        self.name = name
    }
}

class Product
{
    let brand : Brand
    let name : String!
    var description : String!
    var about : String?
    var price : Double!

    var categories = [Category]()

    init(brand : Brand, name : String, description : String, about : String, price : Double, categories : [Category])
    {
        self.brand = brand
        self.name = name
        self.description = description
        self.about = about
        self.price = price
        self.categories = categories
    }

    func addCategory(category : Category)
    {
        categories.append(category)
    }
}

class Brand
{
    let name : String

    init(name : String)
    {
        self.name = name
    }
}





//- Farklı türlerdeki araçların modellemesi yapılacaktır.
//- Araç türleri olarak Otomobil, kamyon, otobüs olacaktır.
//- Tüm Araçların tekerlek sayısı, yolcu kapasitesi, ileri-geri gidebilme özellikleri olacaktır.
//- Otomobillerin yolcu kapasitesi en fazla 4 kişi olabilirken, bu sayı kamyonlarda 2 otobüslerde 55 olacaktır.
//- Kamyonların yolcular haricinde yük taşıma kapasitesi de olacaktır.
//- Kamyon ve otobüslerde 88 km/h hız limiti bulunacaktır.
//- Otobüsler yolcunun yanında bagaj taşıma kapasitesi ve mutfak özelliği bulunacaktır.

class Vehicle
{
    let numofWheels : Int!
    var passengerCapacity : Int

    init(passengerCapacity : Int)
    {
        self.passengerCapacity = passengerCapacity
    }

    func goForward() -> String
    {
        return "vehicle is going forward"
    }

    func goBack() -> String
    {
        return "vehicle is going back"
    }
}

class Car : Vehicle
{
    init()
    {
        super.init(passengerCapacity: 4)
    }
}

class HeavyVehicle : Vehicle
{
    var speedLimit : Int = 88
}

class Truck : HeavyVehicle
{
    var loadCapacity : Double!

    init()
    {
        super.init(passengerCapacity: 2)
    }
}

class Bus : HeavyVehicle
{
    var luggageCapacity : Double = 0
    var hasKitchen : Bool = true

    init()
    {
        super.init(passengerCapacity: 55)
    }
}





//enum Role
//{
//    case mudur
//    case mudurYardimcisi
//    case yazilimci
//    case temizlikci
//}
//
//class calisan : calisanProtocol
//{
//    var role : Role
//    let sicilNo: Int
//    let ad: String
//    let soyad: String
//
//    init(role : Role, sicilNo : Int, ad : String, soyad : String)
//    {
//        self.role = role
//        self.sicilNo = sicilNo
//        self.ad = ad
//        self.soyad = soyad
//    }
//
//    func izinKullan() -> String
//    {
//        return "izin kullanildi"
//    }
//}
//
//protocol yoneticiProtocol
//{
//    func controlCalisan() -> String
//}
//
//protocol calisanProtocol
//{
//    var sicilNo : Int { get }
//    var ad : String { get }
//    var soyad : String { get }
//
//    func izinKullan() -> String
//}
//
//class yonetici : calisan, yoneticiProtocol
//{
//    func controlCalisan() -> String {
//        return "calisanlar kontrol edildi"
//    }
//}
//
//class mudur : yonetici
//{
//    override func controlCalisan() -> String {
//        return "mudur yardimcisi ve altlarini yonet"
//    }
//}
//
//class mudurYardimcisi : yonetici
//{
//    override func controlCalisan() -> String {
//        return "yazilinci ve altlarini yonet"
//    }
//}
//
//class yazilimci : calisan
//{
//
//}
//
//class temizlikci : calisan
//{
//
//}





protocol ElectronicDeviceProtocol
{
    var circuitInfo : String { get }
    var programmability : Bool { get }
}

public class ElectronicDevice : ElectronicDeviceProtocol
{
    var circuitInfo : String
    var programmability : Bool
    
    init(circuitInfo : String, programmability : Bool)
    {
        self.circuitInfo = circuitInfo
        self.programmability = programmability
    }
}

protocol PhoneProtocol
{
    var number : Int { get set }
}

protocol ComputerProtocol
{
    var macAddress : String { get }
}

protocol WashingMachineProtocol
{
    var rpm : Int { get set }
    
    func wash() -> String
}

class Phone : ElectronicDevice, PhoneProtocol
{
    var number: Int = 537
}

class Computer : ElectronicDevice, ComputerProtocol
{
    var macAddress: String = "MAC"
}

class WashingMachine : ElectronicDevice, WashingMachineProtocol
{
    var rpm: Int = 2100

    func wash() -> String {
        return "washed"
    }
}

protocol DesktopProtocol
{
    var performanceRate : Double { get set }
}

protocol LaptopProtocol
{
    var chargingTime : Int { get set }
}

protocol WithScreenPhoneProtocol
{
    var inch : Double { get }
}

protocol NoScreenPhoneProtocol
{
    var model : String { get set }
}

class Desktop : Computer, DesktopProtocol
{
    var performanceRate: Double = 79.2
}

class Laptop : Computer, LaptopProtocol
{
    var chargingTime: Int = 2
}

class WithScreenPhone : Phone, WithScreenPhoneProtocol
{
    var inch: Double = 5.8
}

class NoScreenPhone : Phone, NoScreenPhoneProtocol
{
    var model: String = "qazwsxedcrfvtgbyhnujm"
}
