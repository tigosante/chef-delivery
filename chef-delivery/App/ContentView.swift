//
//  ContentView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 28/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                NavigationBar()
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
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
}

#Preview {
    ContentView()
}
