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
    @Published var errorMessage: String = ""
    @Published var showAlert: Bool = false
    @Published var isAuthenticated: Bool = false
    @Published var isLoading: Bool = false

    
    var service: ServiceProtocol
    var cancellables = Set<AnyCancellable>()
    
    var passwordsMatch: Bool {
            return password == confirmPassword
        }
    
    init(service: ServiceProtocol){
        self.service = service
    }
    
    func signUP(){
        let parameters = [
            "name": name,
            "email": email,
            "password": password,
            "phone": phone,
            "device_token": ""
        ]
        isLoading = true
        service.userAuthRequest(url: "https://yogahez.mountasher.online/api/client-register", parameters: parameters, type: RegistrationResponse.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
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
            })
            .store(in: &cancellables)
    }
}
