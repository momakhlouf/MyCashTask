//
//  Service.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import Foundation
import Combine

protocol ServiceProtocol{
    func fetch<T: Decodable>(type: T.Type, url: URL) -> AnyPublisher<T, APIError>
    func fetchCategories() -> AnyPublisher<CategoriesResponse, APIError>
    func fetchPopularSellers() -> AnyPublisher<PopularSellersResponse, APIError>
    func fetchTrendingSellers() -> AnyPublisher<TrendingSellersResponse, APIError>
    func userAuthRequest<T: Decodable>(url: String, parameters: [String: String], type: T.Type) -> AnyPublisher<T, APIError>
    func fetchUserDataByToken() -> AnyPublisher<ClientResponse, APIError>
}

class Service: ServiceProtocol{
    
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
    
    func userAuthRequest<T: Decodable>(url: String, parameters: [String: String], type: T.Type) -> AnyPublisher<T, APIError> {
        
        guard let url = URL(string: url) else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("ar", forHTTPHeaderField: "lang")
        
        let postData = parameters.map { "\($0)=\($1)" }
            .joined(separator: "&")
            .data(using: .utf8)
        
        request.httpBody = postData
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global())
            .mapError { _ in APIError.decodingError }
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                APIError.decodingError
            }
            .eraseToAnyPublisher()
    }
    
    func fetchUserDataByToken() -> AnyPublisher<ClientResponse, APIError>{
        
        guard let token = UserManager.shared.getToken() else{
            return Fail(error: .unknown).eraseToAnyPublisher()
        }
        guard let url = URL(string: "https://yogahez.mountasher.online/api/client-profile")else{
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
       return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: ClientResponse.self, decoder: JSONDecoder())
            .mapError { error in
                APIError.decodingError
            }
            .eraseToAnyPublisher()
    }
}

