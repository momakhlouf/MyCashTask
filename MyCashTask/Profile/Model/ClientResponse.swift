//
//  ClientResponse.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 09/01/2024.
//

import Foundation

struct ClientResponse: Codable {
    let success: Bool
    let responseCode: Int?
    let message: String
    let data: ClientData?
    
    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message
        case data
    }
}

struct ClientData: Codable {
    let id: Int?
    let name: String
    let email: String
    let phone: String
    let image: String?
    let type: Int?
    let status: Int?
    let balance: String?
    let token: String?
}
