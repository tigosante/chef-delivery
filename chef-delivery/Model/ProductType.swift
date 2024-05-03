//
//  ProductType.swift
//  chef-delivery
//
//  Created by Tiago Silva on 03/05/24.
//

import Foundation

struct ProductType: Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$ " + price.formartPrice()
    }
}
