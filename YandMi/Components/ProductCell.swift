//
//  ProductCell.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 29.07.2022.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    var body: some View {
        
        VStack(spacing: 2) {
            Image("vkusleta")
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
