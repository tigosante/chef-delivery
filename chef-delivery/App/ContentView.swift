//
//  ContentView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 28/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationBar()
                .padding(.horizontal, 15)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    OrderTypeGridView()
                    CarouselTabView()
                    StoresContainerView(orders: storeMock)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
