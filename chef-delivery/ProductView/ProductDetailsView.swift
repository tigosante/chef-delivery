//
//  ProductDetailsView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 03/05/24.
//

import SwiftUI

struct ProductDetailsView: View {
    let product: ProductType
    @State var productQuantity = 1
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            Spacer()
            ProductDetailQuantityView(productQuantity: $productQuantity)
            Spacer()
            ProductDetailButtonView()
        }
    }
}

#Preview {
    ProductDetailsView(product: storesMock[0].products[0])
}
