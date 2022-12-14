//
//  CartView.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 29.07.2022.
//

import SwiftUI

struct CartView: View {
    
   @StateObject var viewModel: CartViewModel
    @State var showAlert: Bool = false
    
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
                            Text("Вилучити")
                        }.tint(.red)
                    }
            }
            .listStyle(.plain)
            .navigationTitle("Кошик")
            
            HStack {
                Text("Разом:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(self.viewModel.cost) UAH")
                    .fontWeight(.bold)
            }.padding()
            
            HStack {
                Text("Посилка буде надісланна на данні вказані у профілі")
                    .fontWeight(.bold)
                    .padding()
            }
        
            HStack(spacing: 24) {
                Button {
                    viewModel.clearr()
                    print("Отменить")
                } label: {
                    Text("Скасувати")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(24)
                }
            
                Button {
                    print("Заказать")
                    var order = Order(userID: AuthService.shared.currentUser!.uid,
                                      date: Date(),
                                      status: OrderStatus.new.rawValue)
                    order.positions = self.viewModel.positions
                    
                    DatabaseService.shared.setOrder(order: order)
                    { result in
                        switch result {
                        case .success(let order):
                            viewModel.clearr()
                            showAlert.toggle()
                            print(order.cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Замовити")
                        .font(.body)
                       .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(24)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Ваше замовлення вже готується, дякуємо, що ви з нами!")) }
            }.padding()
            
            
      }
}

}
///
/////////
////dsdssdd

