//
//  OrderView.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 15.08.2022.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var viewModel: OrderViewModel
    
    var body: some View {
        
        List {
            ForEach(viewModel.order.positions, id: \.id) { position in
                PositionCell(position: position)
            }
        }
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(order: Order(userID: "",
                                                         date: Date(),
                                                         status: "Новый")))
    }
}
