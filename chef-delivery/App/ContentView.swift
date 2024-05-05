//
//  ContentView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 28/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading: Bool = true
    @State private var storesTypes: [StoreType] = []
    private var service = HomeService()
    
    var body: some View {
        NavigationView {
            if isLoading {
                ProgressView()
            } else {
                VStack(spacing: 0) {
                    NavigationBar()
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresDetailContainerView(stores: storesTypes)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await getStores()
            }
        }
    }
    
    func getStores() async {
        do {
            if !isLoading { isLoading = true }
            
            let result = try await service.fetchData()
            switch result {
            case .success(let stores):
                storesTypes = stores
                isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                isLoading = false
            }
        } catch {
            print(error.localizedDescription)
            isLoading = false
        }
    }
}

#Preview {
    ContentView()
}
