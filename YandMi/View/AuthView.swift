//
//  ContentView.swift
//  Yandmi
//
//  Created by Полина on 26.07.2022.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isAuth = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isTabViewShow = false
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text(isAuth ? "Авторизация" : "Регистрация")
                .padding(isAuth ? 16 : 24)
                .padding(.horizontal, 30)
                .font(.title2.bold())
                .background(Color("whiteAlpha"))
                .cornerRadius(isAuth ? 30 : 60)
            
            
            VStack(spacing:20){
                TextField("Введите Email", text: $email)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(12)
                    .padding(.horizontal, 12)
                
                if !isAuth {
                    SecureField("Повторите пароль", text: $confirmPassword)
                        .padding()
                        .background(Color("whiteAlpha"))
                        .cornerRadius(12)
                        .padding(.horizontal, 12)
                }
                
                Button {
                    if isAuth {
                        print("Авторизация пользователяф через Firebase")
                        
                        AuthService.shared.signIn(email: self.email,
                                                  password: self.password) { result in
                            switch result {
                            case .success(_):
                                isTabViewShow.toggle()
                            case .failure(_):
                                alertMessage =
                                "Ты ошибся, будь пожалуйста внимательнее"
                                
                                isShowAlert.toggle()    
                            }
                        }
                        
                    } else {
                        print("Регистрация пользователя")
                        
                        guard password == confirmPassword else {
                            self.alertMessage = "Пароли не совпадают!"
                            self.isShowAlert.toggle()
                            return
                        }
                        
                        AuthService.shared.Registration(email: self.email,
                                                        password: self.password) { result in
                            switch result {
                                
                            case .success(let user):
                                
                                alertMessage = """
                                Умничка бубочка ты зарегистрировался
                                \(user.email!)
                                """
                                
                                self.isShowAlert.toggle()
                                self.email = ""
                                self.password = ""
                                self.confirmPassword = ""
                                self.isAuth.toggle()
                                
                            case .failure(let error):
                                alertMessage =
                                """
                                Ошибка регистрации
                                \(error.localizedDescription)!
                                """
                                self.isShowAlert.toggle()
                            }
                            
                        }
                                                        
                        
                    }
                } label: {
                    Text(isAuth ? "Войти" : "Создать аккаунт")
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("brown"), Color("brown2")], startPoint: .leading, endPoint: .trailing))
                        .font(.title3.bold())
                        .background(Color("whiteAlpha"))
                        .cornerRadius(12)
                        .foregroundColor(.black)
                }
                
                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Ещё не с нами?" : "Уже есть аккаунт!")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .cornerRadius(12)
                        .foregroundColor(Color("brown"))
                }
                
            }
            .padding()
            .padding(.top, 20)
            .background(Color("whiteAlpha"))
            .cornerRadius(24)
            .padding(isAuth ? 30 : 12)
            .alert(alertMessage,
                   isPresented: $isShowAlert) {
                Button { } label: {
                    
                    Text("OK")
                }
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("bg")
                .ignoresSafeArea()
                .blur(radius: isAuth ? 0 : 6)
            )
            .animation(Animation.easeInOut(duration: 0.3), value: isAuth)
            .fullScreenCover(isPresented: $isTabViewShow) {
                
                let mainTabBarViewModel = MainTabBarViewModel(user:
                AuthService.shared.currentUser!)
                
                MainTabBar(viewModel: mainTabBarViewModel)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
