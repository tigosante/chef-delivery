//
//  StoresContainerView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 29/04/24.
//

import SwiftUI

struct StoresContainerView: View {
    let orders: [OrderType]
    let title = "Lojas"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 30) {
                ForEach(orders, id: \.id) { store in
                    NavigationLink {
                        StoreDetailsView(store: store)
                    } label: {
                        StoreItemView(order: store)
                    }
                    .foregroundColor(.black)
                    
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    StoresContainerView(orders: storeMock)
}
