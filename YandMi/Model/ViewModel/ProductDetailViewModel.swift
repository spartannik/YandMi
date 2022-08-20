//
//  ProductDetailViewModel.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 02.08.2022.
//

import Foundation
import UIKit


class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product 
    @Published var count = 0
    @Published var image = UIImage(named: "vkusleta")!
    
    init(product: Product) {
        self.product = product
    }
    
    func getImage() {
        StorageService.shared.downloadProductImage(id: product.id) { result in
            switch result {
                
            case .success(let data):
                if let image = UIImage(data: data){
                    self.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
