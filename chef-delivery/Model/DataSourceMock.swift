//
//  DataSourceMock.swift
//  chef-delivery
//
//  Created by Tiago Silva on 29/04/24.
//

import Foundation

let ordersMock: [OrderType] = [
    OrderType(id: 1, name: "Restaurantes", image: "hamburguer"),
    OrderType(id: 2, name: "Formácia", image: "farmacia"),
    OrderType(id: 3, name: "Descontos", image: "descontos"),
    OrderType(id: 4, name: "Gourmet", image: "gourmet"),
    OrderType(id: 5, name: "Mercado", image: "mercado"),
    OrderType(id: 6, name: "Pet", image: "petshop"),
    OrderType(id: 7, name: "Bebidas", image: "bebidas"),
]

let storeMock: [OrderType] = [
    OrderType(id: 1, name: "Monstro Burger", image: "monstro-burger-logo"),
    OrderType(id: 2, name: "Food Court", image: "food-court-logo"),
    OrderType(id: 3, name: "Acai Panda", image: "acai-panda-logo"),
    OrderType(id: 4, name: "Bakery", image: "bakery-logo"),
    OrderType(id: 5, name: "Carbron", image: "carbron-logo"),
]
