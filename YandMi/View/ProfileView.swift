//
//  ProfileView.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 29.07.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            HStack(spacing: 16) {
                Image("User")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(8)
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }
                    .confirmationDialog("Звідки взяти фото?", isPresented: $isAvaAlertPresented) {
                        Button {
                            print("Library")
                        } label: {
                            Text("З галереї")
                        }
                        
                        Button {
                            print("Camera")
                        } label: {
                            Text("З камери")
                        }
            
                    }
                
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Імʼя", text: $viewModel.profile.name)
                        .font(.body.bold())
                    
                    HStack {
                        Text("+380")
                        TextField("Телефон", value: $viewModel.profile.phone, format: IntegerFormatStyle.number)
                    }
                }
        }
        
        VStack (alignment: .leading, spacing: 8) {
            Text("Адреса доставки")
                .bold()
            TextField("Ваша Адреса", text: $viewModel.profile.address)
        }.padding(.horizontal)
            
            //Таблица с заказами
           List {
                if viewModel.orders.count == 0 {
                 Text("Ваші замовлення будуть тут")
               } else {
                   ForEach(viewModel.orders, id: \.id) { order in
                        OrderCell(order: order)
               }
           }
                            
            }.listStyle(.plain)
            
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Вийти")
                    .padding()
                    .padding(.horizontal)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }.padding()
                .confirmationDialog("Дійсно хочете вийти?", isPresented: $isQuitAlertPresented) {
                    Button {
                        isAuthViewPresented.toggle()
                    } label: {
                        Text("Так")
                    }
                }
                .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                    AuthView()
                }
          }
        
        .onSubmit {
            viewModel.setProfile()
        }
        
        .onAppear {
            self.viewModel.getProfile()
            self.viewModel.getOrders()
        }
        
     }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: NYUser(id: "",
                                                                name: "",
                                                                phone: 0,
                                                                address: "")))
    }
}

