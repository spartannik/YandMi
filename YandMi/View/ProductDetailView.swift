//
//  ProductDetailView.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 29.07.2022.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State var viewModel: ProductDetailViewModel
    @State var typeChocolates = "45%"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
        
                Image(uiImage: self.viewModel.image)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 260)
            
            HStack {
                Text("\(viewModel.product.title)!")
                    .font(.title2.bold())
                Spacer()
                    .font(.title2)
                
                Text("\(viewModel.product.price) UAH")
                        .font(.title2)
            }.padding(.horizontal)
                     
            Text("\(viewModel.product.descript)")
                .padding(.horizontal)
                .padding(.vertical, 4)
                
            
                
                HStack {
                    Stepper("Количество", value: $count, in: 1...1000)
                        
                    Text("\(self.count)")
                        .padding(.leading, 32)
                    
                }.padding(.horizontal)
                
            
            }
            Button {
                let position = Position(id: UUID().uuidString,
                                        product: viewModel.product,
                                        count: self.count)
                
                CartViewModel.shared.addPosition(position)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("В корзину!")
                    .padding()
                    .padding(.horizontal, 60)
                    .foregroundColor(.black)
                    .font(.title2.bold())
                    .background(LinearGradient(colors: [Color("brown"), Color("brown2")], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)
            }
            .onAppear {
                self.viewModel.getImage()
            }
            
            
            Spacer()
        }
            
        }
    
    }


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "1",
                                                                            title: "Вкус 45:",
                                                                            imageUrl: "Not found",
                                                                            price: 170,
                                                                            descript: "малина,черника")
                                                            ))
    }
}
