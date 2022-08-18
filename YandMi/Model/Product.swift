//
//  Product.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 29.07.2022.
//

import Foundation

struct Product {
    
    var id: String
    var title: String
    var imageUrl: String = ""
    var price: Int
    var descript: String
    
    //var orderCount: Int
   // var isRecommend: Bool
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["title"] = self.title
        repres["price"] = self.price
        repres["descript"] = self.descript
        return repres
        
    }
    
    
}
