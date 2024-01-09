//
//  PopularSellersViewModel.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import Foundation
import Combine

class PopularSellersViewModel: ObservableObject{
    
    @Published var popularSellers: [PopularSeller] = []
    @Published var searchText: String = ""
    @Published private var isFavorite: Bool = false

    var filteredPopularSeller: [PopularSeller]{
        guard !searchText.isEmpty else{
            return popularSellers
        }
       return popularSellers.filter{$0.name.localizedCaseInsensitiveContains(searchText)}
    }
    var service = Service()
    var cancellables = Set<AnyCancellable>()

    init(){
        fetchPopularSellers()
    }
    
    func fetchPopularSellers(){
        service.fetchPopularSellers()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .finished:
                    print("success")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { returnedRestaurant in
                self.popularSellers = returnedRestaurant.data
                print(returnedRestaurant.data)
            }
            .store(in: &cancellables)

    }
}
