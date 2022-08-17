//
//  AuthService.swift
//  Yandmi
//
//  Created by Nikita Yashchenko on 10.08.2022.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    
    private init() {
    }
    
    private let auth = Auth.auth()
    
    var currentUser: User? {
        return auth.currentUser
    }
    
    func signOut() {
      try! auth.signOut()
    }
    
    func Registration(email: String,
                      password: String,
                      completion: @escaping(Result<User, Error>) -> Void) {
        
        auth.createUser(withEmail: email,
                        password: password) { result, error in
            
                            if let result = result {
                                let nyUser = NYUser (id: result.user.uid,
                                                     name: "",
                                                     phone: 0,
                                                     address: "")
                                
                                DatabaseService.shared.setProfile(user: nyUser) { resultDB in
                                    switch resultDB {
                                    case .success(_):
                                        completion(.success(result.user))
                                    case .failure(let error):
                                        completion(.failure(error))
                                    }
                                }
                            } else if let error = error {
                                completion(.failure(error))
                        }
                 }
        
             }
    
    func signIn(email: String,
                 password: String,
                 completion: @escaping(Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
