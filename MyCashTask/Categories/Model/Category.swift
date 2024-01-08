//
//  Category.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import Foundation

struct CategoriesResponse: Codable {
    let data: CategoriesData
}

struct CategoriesData: Codable {
    let data: [Category]
}

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let active: Int
    let nameAr: String
    let nameEn: String

    enum CodingKeys: String, CodingKey {
        case id, name, image, active
        case nameAr = "name_ar"
        case nameEn = "name_en"
    }
}


//struct CategoriesResponse: Codable {
//    let data: CategoryData
//}
//
//struct CategoryData: Codable{
//    let data = [Category]
//}
//
//struct Category: Codable, Identifiable {
//    let id: Int
//    let name: String?
//    let image: String?
//    let active: Int?
//    let nameAr: String?
//    let nameEn: String?
//    
//    enum CodingKeys:String, CodingKey {
//        case id
//        case name
//        case image
//        case active
//        case nameAr = "name_ar"
//        case nameEn = "name_en"
//    }
//}
