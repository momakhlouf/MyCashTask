//
//  ProfileViewModel.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 09/01/2024.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject{
    
    @Published var clientData: ClientData?
    @Published var errorMessage: String = ""
    @Published var isNotAuthenticated: Bool = false
    
    var service = Service()
    var cancellables = Set<AnyCancellable>()
    
    init(){
        fetchUser()
    }
    
    func fetchUser(){
        service.fetchUserDataByToken()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    self.errorMessage = "An error occurred. Please try again."
                }
            } receiveValue: { [weak self] returnedData in
                self?.clientData = returnedData.data
            }
            .store(in: &cancellables)

    }

}
