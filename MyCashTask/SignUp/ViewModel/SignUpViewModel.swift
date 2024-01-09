//
//  SignUpViewModel.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 07/01/2024.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject{
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var phone: String = ""
    @Published var confirmPassword: String = ""
   // @Published var passwordsMatch: Bool = false
    @Published var isConfirmPasswordFieldActive = false
    @Published var errorMessage: String = ""
    @Published var showAlert: Bool = false
    @Published var isAuthenticated: Bool = false

    
    var service = Service()
    var cancellables = Set<AnyCancellable>()
    
    var passwordsMatch: Bool {
            return password == confirmPassword
        }
    
    func signUP(){
        let parameters = [
            "name": name,
            "email": email,
            "password": password,
            "phone": phone,
            "device_token": ""
        ]
        
        service.userAuthRequest(url: "https://yogahez.mountasher.online/api/client-register", parameters: parameters, type: RegistrationResponse.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
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
                print(returnedData)
            })
            .store(in: &cancellables)
    }
}
