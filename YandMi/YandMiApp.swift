//
//  YandmiApp.swift
//  Yandmi
//
//  Created by Полина on 26.07.2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

let screen = UIScreen.main.bounds

@main
struct YandMiApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            
            if let user = AuthService.shared.currentUser {
                let viewModel = MainTabBarViewModel(user: user)
                MainTabBar(viewModel: viewModel)
            } else {
                AuthView()
            }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            print("ОК")
            
            return true
        }
        
    }
    
    
    
}
