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
    let layoutForPopularProduct25 = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    let layoutForPopularProduct45 = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    let layoutForPopularProduct75 = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    let layoutForPopularProduct85 = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    let layoutForPopularProduct100 = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    let layoutForPopularProductNabor = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false) {
            
            Section("Популярное") {
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
            
            
            Section("25%(Белый шоколад)") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPopularProduct25, spacing: 10) {
                        ForEach(CatalogViewModel.shared.chocolates25, id: \.id) {
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
            
            
            Section("45%(Молочный шоколад)") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPopularProduct45, spacing: 10) {
                        ForEach(CatalogViewModel.shared.chocolates45, id: \.id) {
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
            
            
            Section("75%(Темный шоколад)") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPopularProduct75, spacing: 10) {
                        ForEach(CatalogViewModel.shared.chocolates75, id: \.id) {
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
            
            
            Section("85%(Темный шоколад)") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPopularProduct85, spacing: 10) {
                        ForEach(CatalogViewModel.shared.chocolates85, id: \.id) {
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
            
            
            Section("100%(Экстра черный шоколад)") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPopularProduct75, spacing: 10) {
                        ForEach(CatalogViewModel.shared.chocolates100, id: \.id) {
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
            
            
            Section("Наборы") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPopularProductNabor, spacing: 10) {
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
    
    
    
        }.navigationTitle("Каталог")
        
        
    }
    
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}

