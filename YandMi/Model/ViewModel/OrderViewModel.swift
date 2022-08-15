//
//  OrderViewModel.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 15.08.2022.
//

import Foundation

class OrderViewModel: ObservableObject {
    
    @Published var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
}
