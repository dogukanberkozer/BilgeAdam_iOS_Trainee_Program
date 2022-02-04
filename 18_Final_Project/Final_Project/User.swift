//
//  Member.swift
//  Final_Project
//
//  Created by Dogukan Berk Ozer on 3.02.2022.
//

import Foundation

class MainKullanici {
    var name : String?
    var soyad : String?
    var telNumber : String?
    var email : String!
    var password : String!
    var kullaniciTipi : KullaniciTipi? {
        get
        {
            return .hizmetAlan
        }
    }
}

class HizmetAlan : MainKullanici {
    override var kullaniciTipi : KullaniciTipi?{
        get
        {
            return .hizmetAlan
        }
    }
}

class HizmetVeren : MainKullanici {
  override  var kullaniciTipi : KullaniciTipi?{
        get
        {
            return .hizmetVeren
        }
    }
    var tanitim : String!
    var hizmetListesi:[Hizmet]?
}

enum KullaniciTipi : String {
    case hizmetAlan = "A"
    case hizmetVeren = "S"
}

class Hizmet{
    var baslik:String?
    var aciklama:String?
    var key:String?
}

//class User {
//
//    var name: String?
//    var surname: String?
//    var phoneNumber: String?
//    var email: String!
//    var password: String!
//    var userType: userType?{
//        get
//        {
//            return .hizmetAlan
//        }
//    }
//}
//
//class HizmetAlan : User {
//
//    override var userType: userType?{
//        get
//        {
//            return .hizmetAlan
//        }
//    }
//}
//
//class HizmetVeren : User {
//
//  override  var userType: userType?{
//        get
//        {
//            return .hizmetVeren
//        }
//    }
//    var tanıtım : String!
//}
//
//enum userType : String{
//
//    case hizmetAlan
//    case hizmetVeren
//}
