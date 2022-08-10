//
//  PositionCell.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 09.08.2022.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) шт.")
            Text("\(position.cost) UAH")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
        
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(
            position: Position(id: UUID().uuidString,
                               product: Product(id: UUID().uuidString,
                                                title: "25 белый шоколад",
                                                imageUrl: "vkusleta",
                                                price: 350,
                                                descript: "gfgdsg"),
                               count: 3)
        
        )
    }
}
