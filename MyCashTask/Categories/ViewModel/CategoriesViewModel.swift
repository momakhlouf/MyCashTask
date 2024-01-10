//
//  CategoriesViewModel.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import Foundation
import Combine

class CategoriesViewModel: ObservableObject{
    @Published var categories: [Category] = []
  
    var service: ServiceProtocol
    var cancellables = Set<AnyCancellable>()

    init(service: ServiceProtocol){
        self.service = service
        fetchCategories()
    }
    
    func fetchCategories(){
        service.fetchCategories()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .finished:
                    print("success")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { returnedCategories in
                self.categories = returnedCategories.data.data
                print(returnedCategories.data.data)
            }
            .store(in: &cancellables)

    }
}
