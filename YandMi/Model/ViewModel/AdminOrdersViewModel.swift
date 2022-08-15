//
//  AdminOrdersViewModel.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 15.08.2022.
//

import Foundation

class AdminOrdersViewModel: ObservableObject {

    @Published var orders = [Order]()
    
    
    func getOrders() {
        DatabaseService.shared.getOrders(by: nil) { result in
            switch result {
            case .success(let orders):
                self.orders = orders
                for (index, order) in self.orders.enumerated() {
                    DatabaseService.shared.getPositions(by: order.id) { result in
                        switch result {
                        case .success(let positions):
                            self.orders[index].positions = positions
                            print(self.orders[index].cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                        
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
      }
   }
}
