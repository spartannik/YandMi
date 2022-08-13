//
//  Order.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 13.08.2022.
//

import Foundation

struct Order {
    
    var id: String = UUID().uuidString
    var userID: String
    var positions = [Position]()
    var date: Date
    var status: String
    
    var cost: Int {
        var sum = 0
        for position in positions {
            sum += position.cost
        }
        return sum
    }
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = id
        repres["userID"] = userID
        repres["date"] = date
        repres["status"] = status
        return repres
    }
    
}
