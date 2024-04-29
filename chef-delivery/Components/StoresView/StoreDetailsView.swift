//
//  StoreDetailsView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 29/04/24.
//

import SwiftUI

struct StoreDetailsView: View {
    let store: OrderType
    
    var body: some View {
        Text(store.name)
    }
}

#Preview {
    StoreDetailsView(store: storeMock[0])
}
