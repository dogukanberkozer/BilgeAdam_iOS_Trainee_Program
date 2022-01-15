//
//  main.swift
//  02_Swift
//
//  Created by Dogukan Berk Ozer on 10.01.2022.
//

import Foundation

func copyFun<T>(myList : [T]) -> [T]
{
    var newList = [T]()

    for item in myList
    {
        newList.append(item)
    }

    return newList
}





enum Hatalar : String, Error
{
    case h1 = "Hata 100"
    case h2 = "Hata 101"
    case h3 = "Hata 102"
}





class SpecificError : Error {
    var code: Int
    var title: String?
    var description : String?

    init(code : Int, title: String?, description: String?) {
        self.title = title ?? "Error"
        self.description = description ?? "Unknown Error!"
        self.code = code
    }
}

class Errors
{
    static var h1 = SpecificError(code: 10, title: "Beklenmeyen hata", description: "Sistem Hatası")
    static var h2 = SpecificError(code: 11, title: "Hata 2", description: "Açıklama")
}

func errorControl() throws -> String
{
    if 3 < 5
    {
        throw Errors.h1
        //throw SpecificError(code: 10, title: "Beklenmeyen hata", description: "System Error!")
    }
    
    return "No Error"
}

do
{
    var durum = try errorControl()
    print(durum)
}
catch
{
    let hata = error as! SpecificError
    print(hata.title)
}
