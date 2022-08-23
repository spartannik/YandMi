//
//  CatalogViewModel.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 29.07.2022.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var PopularProducts = [
        Product(id: "1",
                                     title: "Вкус 45:",
                                     imageUrl: "Not found",
                                     price: 170,
                                     descript: "малина,черника"),        
    ]
    
    @Published var chocolates = [
        Product(id: "1",
                                     title: "Вкус 45:",
                                     imageUrl: "Not found",
                                     price: 170,
                                     descript: "малина,черника")
        
    ]
    
    
    func getProducts() {
        DatabaseService.shared.getProducts { result in
            switch result {
                
            case .success(let products):
                self.chocolates = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
