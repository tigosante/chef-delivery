//
//  OrderTypeGridView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 29/04/24.
//

import SwiftUI

struct OrderTypeGridView: View {
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    }
    
    var body: some View {
        LazyHGrid(rows: gridLayout, spacing: 15,
                  content: {
            ForEach(ordersMock, id: \.id) { orderItem in
                OrderTypeView(orderType: orderItem)
            }
        })
        .frame(height: 200)
        .padding(15)
    }
}

#Preview {
    OrderTypeGridView()
        .previewLayout(.sizeThatFits)
}
