//
//  Catalog.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 29.07.2022.
//

import SwiftUI

struct CatalogView: View {
    
    let layoutForChocolates = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    let layoutForPopularProduct = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    
    @StateObject var viewModel = CatalogViewModel()
    
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false) {
            
            Section("Популярне") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPopularProduct, spacing: 10) {
                        ForEach(CatalogViewModel.shared.PopularProducts, id: \.id) {
                            item in
                            NavigationLink {
                                
                                let viewModel = ProductDetailViewModel(product: item)
                                
                                ProductDetailView(viewModel: viewModel)
                            }label:{
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                            
                          
                        }
                    }.padding()
                }
            }
            
            
            Section("Шоколадні вироби") {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layoutForChocolates, spacing: 10) {
                        ForEach(viewModel.chocolates, id: \.id) {
                            item in
                            NavigationLink {
                                
                                let viewModel = ProductDetailViewModel(product: item)
                                
                                ProductDetailView(viewModel: viewModel)
                            }label:{
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                            
                          
                        }
                    }.padding()
                }
            }
            
    
    
    
        }.navigationTitle("Каталог")
            .onAppear {
                print("Gets products")
                self.viewModel.getProducts()
            }
        
    }
    
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}

