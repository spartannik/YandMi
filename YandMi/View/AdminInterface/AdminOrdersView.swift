//
//  AdminOrdersView.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 15.08.2022.
//

import SwiftUI

struct AdminOrdersView: View {
    
    @StateObject var viewModel = AdminOrdersViewModel()
    @State var isOrderViewShow = false
    @State var isShowAuthView = false
    @State private var isShowAddProductView = false
    
    var body: some View {
        
        
        VStack {
            HStack {
                Button {
                    AuthService.shared.signOut()
                    isShowAuthView.toggle()
                } label: {
                    Text("Выход")
                        .foregroundColor(.red)
                }
                Spacer()
                Button {
                    isShowAddProductView.toggle()
                } label: {
                    Text("Добавить товар")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                }
                Spacer()
                Button {
                    viewModel.getOrders()
                } label: {
                    Text("Обновить")
                }
            }.padding()
            List {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                        .onTapGesture {
                            viewModel.currentOrder = order
                            isOrderViewShow.toggle()
                        }
                   }
            }.listStyle(.plain)
                .onAppear {
                    viewModel.getOrders()
                }
                .sheet(isPresented: $isOrderViewShow) {
                    let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
                    OrderView(viewModel: orderViewModel)
                }
        }.fullScreenCover(isPresented: $isShowAuthView) {
            AuthView()
        }
        .sheet(isPresented: $isShowAddProductView) {
            AddProductView()
        }

        }
    }

struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}
