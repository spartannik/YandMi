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
        Product(id: "2",
                                     title: "Вкус 75%:",
                                     imageUrl: "Not found",
                                     price: 160,
                                     descript: "малина,черника"),
        Product(id: "3",
                                     title: "Вкус 85%:",
                                     imageUrl: "Not found",
                                     price: 200,
                                     descript: "малина,черника"),
        Product(id: "4",
                                     title: "Вкус 100%:",
                                     imageUrl: "Not found",
                                     price: 300,
                                     descript: "малина,черника")
        
    ]
    
    @Published var chocolates25 = [
        Product(id: "1",
                                     title: "Вкус 45:",
                                     imageUrl: "Not found",
                                     price: 170,
                                     descript: "малина,черника"),
        Product(id: "2",
                                     title: "Вкус 75%:",
                                     imageUrl: "Not found",
                                     price: 160,
                                     descript: "малина,черника"),
        Product(id: "3",
                                     title: "Вкус 85%:",
                                     imageUrl: "Not found",
                                     price: 200,
                                     descript: "малина,черника"),
        Product(id: "4",
                                     title: "Вкус 100%:",
                                     imageUrl: "Not found",
                                     price: 300,
                                     descript: "малина,черника")
        
    ]
    
    
    @Published var chocolates45 = [
        Product(id: "1",
                                     title: "Вкус 45:",
                                     imageUrl: "Not found",
                                     price: 170,
                                     descript: "малина,черника"),
        Product(id: "2",
                                     title: "Вкус 75%:",
                                     imageUrl: "Not found",
                                     price: 160,
                                     descript: "малина,черника"),
        Product(id: "3",
                                     title: "Вкус 85%:",
                                     imageUrl: "Not found",
                                     price: 200,
                                     descript: "малина,черника"),
        Product(id: "4",
                                     title: "Вкус 100%:",
                                     imageUrl: "Not found",
                                     price: 300,
                                     descript: "малина,черника")
        
    ]
    
    @Published var chocolates75 = [
        Product(id: "1",
                                     title: "Вкус 45:",
                                     imageUrl: "Not found",
                                     price: 170,
                                     descript: "малина,черника"),
        Product(id: "2",
                                     title: "Вкус 75%:",
                                     imageUrl: "Not found",
                                     price: 160,
                                     descript: "малина,черника"),
        Product(id: "3",
                                     title: "Вкус 85%:",
                                     imageUrl: "Not found",
                                     price: 200,
                                     descript: "малина,черника"),
        Product(id: "4",
                                     title: "Вкус 100%:",
                                     imageUrl: "Not found",
                                     price: 300,
                                     descript: "малина,черника")
        
    ]
    
    
    @Published var chocolates85 = [
        Product(id: "1",
                                     title: "Вкус 45:",
                                     imageUrl: "Not found",
                                     price: 170,
                                     descript: "малина,черника"),
        Product(id: "2",
                                     title: "Вкус 75%:",
                                     imageUrl: "Not found",
                                     price: 160,
                                     descript: "малина,черника"),
        Product(id: "3",
                                     title: "Вкус 85%:",
                                     imageUrl: "Not found",
                                     price: 200,
                                     descript: "малина,черника"),
        Product(id: "4",
                                     title: "Вкус 100%:",
                                     imageUrl: "Not found",
                                     price: 300,
                                     descript: "малина,черника")
        
    ]
    
    @Published var chocolates100 = [
        Product(id: "1",
                                     title: "Вкус 45:",
                                     imageUrl: "Not found",
                                     price: 170,
                                     descript: "малина,черника"),
        Product(id: "2",
                                     title: "Вкус 75%:",
                                     imageUrl: "Not found",
                                     price: 160,
                                     descript: "малина,черника"),
        Product(id: "3",
                                     title: "Вкус 85%:",
                                     imageUrl: "Not found",
                                     price: 200,
                                     descript: "малина,черника"),
        Product(id: "4",
                                     title: "Вкус 100%:",
                                     imageUrl: "Not found",
                                     price: 300,
                                     descript: "малина,черника")
        
    ]
    
    
    @Published var chocolatesNabor = [
        Product(id: "1",
                                     title: "Вкус 45:",
                                     imageUrl: "Not found",
                                     price: 170,
                                     descript: "малина,черника"),
        Product(id: "2",
                                     title: "Вкус 75%:",
                                     imageUrl: "Not found",
                                     price: 160,
                                     descript: "малина,черника"),
        Product(id: "3",
                                     title: "Вкус 85%:",
                                     imageUrl: "Not found",
                                     price: 200,
                                     descript: "малина,черника"),
        Product(id: "4",
                                     title: "Вкус 100%:",
                                     imageUrl: "Not found",
                                     price: 300,
                                     descript: "малина,черника")
        
    ]
    
    func getProducts() {
        DatabaseService.shared.getProducts { result in
            switch result {
                
            case .success(let products):
                self.chocolates25 = products
                self.chocolates45 = products
                self.chocolates75 = products
                self.chocolates85 = products
                self.chocolates100 = products
                self.chocolatesNabor = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
