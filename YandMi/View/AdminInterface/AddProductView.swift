//
//  AddProductView.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 17.08.2022.
//

import SwiftUI

struct AddProductView: View {
    
    @State private var showImagePicker = false
    @State private var image = UIImage(named: "vkusleta")!
    @State private var title: String = ""
    @State private var price: Int? = nil
    @State private var descript: String = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            Text("Добавить товар")
                .font(.title2.bold())
            Image(uiImage: image)
                .resizable()
                .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 1000)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    showImagePicker.toggle()
                }
                .cornerRadius(24)
            TextField("Название продукта", text: $title)
                .padding()
            TextField("Цена продукта", value: $price, format: .number)
                .keyboardType(.numberPad)
                .padding()
            TextField("Описание продукта", text: $descript)
                .padding()
            
            Button {
                guard let price = price else {
                    print("Невозможно извлечь цену из TextField")
                    return
                }
                let product = Product(id: UUID().uuidString, title: title, price: price, descript: descript)
                guard let imageData = image.jpegData(compressionQuality: 0.15) else { return }
                DatabaseService.shared.setProduct(product: product, image: imageData) { result in
                    switch result {
                    case.success(let product):
                        print(product.title)
                        dismiss()
                    case.failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            } label: {
                Text("Сохранить")
                    .padding()
                    .padding(.horizontal,30)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }
            
            Spacer()

        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
