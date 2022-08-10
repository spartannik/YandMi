//
//  NYUser.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 10.08.2022.
//

import Foundation

struct NYUser: Identifiable {
    
    var id: String
    var name: String
    var phone: Int
    var address: String
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["address"] = self.address
        
        return repres
        
    }
    
}
///
