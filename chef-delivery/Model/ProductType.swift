//
//  ProductType.swift
//  chef-delivery
//
//  Created by Tiago Silva on 03/05/24.
//

import Foundation

struct ProductType: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$ " + price.formartPrice()
    }

     private enum CodingKeys: String, CodingKey {
       case id, name, description, image, price
     }
}
