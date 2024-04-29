//
//  StoreItemView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 29/04/24.
//

import SwiftUI

struct StoreItemView: View {
    let order: OrderType
    
    var body: some View {
        let imageSize = CGFloat(50)
        HStack() {
            Image(order.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(imageSize / 2)
                .frame(width: imageSize, height: imageSize)
            Text(order.name)
                .font(.subheadline)
            Spacer()
        }
    }
}

#Preview {
    StoreItemView(order: OrderType(id: 1, name: "Monstro Burger", image: "monstro-burger-logo"))
}
