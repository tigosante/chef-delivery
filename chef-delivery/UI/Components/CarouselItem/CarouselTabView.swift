//
//  CarouselTabView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 29/04/24.
//

import SwiftUI

struct CarouselTabView: View {
    @State private var currentIndex = 1
    
    let ordersMock: [OrderType] = [
        OrderType(id: 1, name: "barbecue banner", image: "barbecue-banner"),
        OrderType(id: 2, name: "brazilian meal banner", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "pokes banner", image: "pokes-banner"),
    ]
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(ordersMock) { item in
                CarouselItemView(order: item)
                    .tag(item.id)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                withAnimation(.easeInOut(duration: 0.25)) {
                    if currentIndex == 3 {
                        currentIndex = 0
                    } else {
                        currentIndex += 1
                    }
                }
            }
        }
    }
}

#Preview {
    CarouselTabView()
}
