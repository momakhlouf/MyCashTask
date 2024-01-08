//
//  Service.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import Foundation
import Combine

class Service{
    
    var cancellable = Set<AnyCancellable>()
    
    func fetch<T: Decodable>(type: T.Type, url: URL) -> AnyPublisher<T, APIError>{
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else{
                    throw APIError.unknown
                }
                return output.data
            }
            .decode(type: type.self, decoder: JSONDecoder())
            .mapError { error in
                APIError.decodingError
            }
            .eraseToAnyPublisher()
    }
    
    
    func fetchCategories() -> AnyPublisher<CategoriesResponse, APIError>{
        guard let url = URL(string: "https://yogahez.mountasher.online/api/home-base-categories")else{
            return Fail(error: APIError.unknown)
                .eraseToAnyPublisher()
        }
        
        return fetch(type: CategoriesResponse.self, url: url)
    }
    
    func fetchPopularSellers() -> AnyPublisher<PopularSellersResponse, APIError>{
        guard let url = URL(string: "https://yogahez.mountasher.online/api/popular-sellers?lat=29.1931&lng=30.6421&filter=1")else{
            return Fail(error: APIError.unknown)
                   .eraseToAnyPublisher()
        }
        
        return fetch(type: PopularSellersResponse.self, url: url)
    }
    
    func fetchTrendingSellers() -> AnyPublisher<TrendingSellersResponse, APIError>{
        guard let url = URL(string: "https://yogahez.mountasher.online/api/trending-sellers?lat=29.1931&lng=30.6421&filter=1")else{
            return Fail(error: APIError.unknown)
                   .eraseToAnyPublisher()
        }
        
        return fetch(type: TrendingSellersResponse.self, url: url)
    }
 
    
}
    // https://yogahez.mountasher.online/api/home-base-categories
    //"https://yogahez.mountasher.online/api/popular-sellers?lat=29.1931&lng=30.6421&filter=1"
    //"https://yogahez.mountasher.online/api/trending-sellers?lat=29.1931&lng=30.6421&filter=1"
