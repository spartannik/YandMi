//
//  ProductCell.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 29.07.2022.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    @State var uiImage = UIImage(named: "vkusleta")
    
    var body: some View {
        
        VStack(spacing: 2) {
            Image(uiImage: uiImage!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                .cornerRadius(16)
            
            HStack {
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 12))
                Spacer()
                Text("\(product.price) UAH")
                    .font(.custom("AvenirNext-regular", size: 12))
            }
            .padding(.horizontal, 2)
            .padding(.bottom, 6)
        }.frame(width: screen.width * 0.45, height: screen.width * 0.65)
            .background(.white)
            .cornerRadius(16)
            .shadow(radius: 4)
            .onAppear {
                StorageService.shared.downloadProductImage(id: self.product.id) { result in
                    switch result {
                    case.success(let data):
                        if let img = UIImage(data: data) {
                            self.uiImage = img
                        }
                    case.failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
    
    
    
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1",
                                     title: "Вкус 75:",
                                     imageUrl: "Not found",
                                     price: 170,
                                     descript: "малина,черника"))
        
    }
}
