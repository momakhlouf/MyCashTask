//
//  PopularSellers.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import Foundation


struct PopularSellersResponse: Codable {
    let data: [PopularSeller]
}

struct PopularSeller: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String?
    let phone: String?
    let image: String
    let logo: String?
    let description: String?
    let distance: String?
    let type: Int?
    let status: Int?
    let lat: String?
    let lng: String?
    let address: String?
    let appointments: String?
    let trending: Int?
    let popular: Int?
    let rate: String?
    let isFavorite: Bool?
}


