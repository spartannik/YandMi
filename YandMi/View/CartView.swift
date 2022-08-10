//
//  CartView.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 29.07.2022.
//

import SwiftUI

struct CartView: View {
    
   @StateObject var viewModel: CartViewModel
    
    var body: some View {
        
        VStack {
            List(viewModel.positions) { position in
                PositionCell(position: position)
                    .swipeActions {
                        Button {
                            viewModel.positions.removeAll { pos in
                                pos.id == position.id
                            }
                        } label: {
                            Text("Удалить")
                        }.tint(.red)
                    }
            }
            .listStyle(.plain)
            .navigationTitle("Корзина")
            
            HStack {
                Text("Итого:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(self.viewModel.cost) UAH")
                    .fontWeight(.bold)
            }.padding()
        
            HStack(spacing: 24) {
                Button {
                    print("Отменить")
                } label: {
                    Text("Отменить")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(24)
                }
            
                Button {
                    print("Заказать")
                } label: {
                    Text("Заказать")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(24)
                }
                
            }.padding()
  }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
  }
}
///
/////////
////dsdssdd
