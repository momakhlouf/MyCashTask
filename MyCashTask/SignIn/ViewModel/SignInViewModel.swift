//
//  SignInViewModel.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 07/01/2024.
//

import Foundation
import Combine

class SignInViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showAlert: Bool = false
    @Published var userData: LoginData?
    @Published var errorMessage: String = ""
    @Published var isAuthenticated: Bool = false

    var service = Service()
    var cancellables = Set<AnyCancellable>()
    
    
    func signIn(){

        let parameters = [
            "email": email,
            "password": password
        ]
        
        service.userAuthRequest(url:"https://yogahez.mountasher.online/api/login", parameters: parameters, type: LoginResponse.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    self.errorMessage = "An error occurred. Please try again."
                }
            }, receiveValue: { [weak self] returnedData in
                if returnedData.success{
                    self?.showAlert = false
                    self?.isAuthenticated = true
                    if let token = returnedData.data?.token{
                        UserManager.shared.saveToken(token)
                    }
                    
                }else{
                    UserManager.shared.clearToken()
                    self?.errorMessage = returnedData.message
                    self?.showAlert = true
                    self?.isAuthenticated = false

                }
                self?.userData = returnedData.data
               
                print(returnedData)
                
            })
            .store(in: &cancellables)
    }
    
}
