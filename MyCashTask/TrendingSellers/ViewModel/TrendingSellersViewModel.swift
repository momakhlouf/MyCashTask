//
//  TrendingSellersViewModel.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import Foundation
import Combine

class TrendingSellersViewModel: ObservableObject{
    @Published var trendingSellers: [TrendingSeller] = []

    var service: ServiceProtocol
    var cancellables = Set<AnyCancellable>()

    init(service: ServiceProtocol){
        self.service = service
        fetchTrendingSellers()
    }
    
    func fetchTrendingSellers(){
        service.fetchTrendingSellers()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .finished:
                    print("trending - success")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { returnedRestaurant in
                self.trendingSellers = returnedRestaurant.data
            }
            .store(in: &cancellables)

    }
}
