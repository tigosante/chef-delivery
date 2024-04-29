//
//  CarouselTabView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 29/04/24.
//

import SwiftUI

struct CarouselTabView: View {
    let ordersMock: [OrderType] = [
        OrderType(id: 1, name: "barbecue banner", image: "barbecue-banner"),
        OrderType(id: 2, name: "brazilian meal banner", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "pokes banner", image: "pokes-banner"),
    ]
    
    var body: some View {
        TabView {
            ForEach(ordersMock, id: \.id) { item in
                CarouselItemView(order: item)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarouselTabView()
}
