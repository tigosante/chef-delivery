//
//  StoreDetailProductsView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 04/05/24.
//

import SwiftUI

struct StoreDetailProductsView: View {
    let store: StoreType
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
            
            ForEach(store.products) { product in
                Button(action: {
                    selectedProduct = product
                }, label: {
                    StoreDetailProductItemView(product: product)
                }
                ).sheet(item: $selectedProduct) { product in
                    ProductDetailsView(product: product)
                }
            }
        }
    }
}

#Preview {
    StoreDetailProductsView(store: storesMock[0])
}
