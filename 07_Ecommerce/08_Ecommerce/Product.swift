//
//  Product.swift
//  08_Ecommerce
//
//  Created by Dogukan Berk Ozer on 19.01.2022.
//

import Foundation
import UIKit

class Product
{
    var category : Category!
    var imgProduct : UIImage!
    var title : String!
    var subTitle : String!
    var description : String!
    var price : Double!
    var oldPrice : Double?
    
    func updatePrice(product : Product, newPrice : Double)
    {
        if(product.price > newPrice)
        {
            product.oldPrice = product.price
            product.price = newPrice
        }
    }
}


