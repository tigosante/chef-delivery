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
    var service = HomeService()
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            Spacer()
            ProductDetailQuantityView(productQuantity: $productQuantity)
            Spacer()
            ProductDetailButtonView {
                Task {
                    await saveProduct()
                }
            }
        }
    }
    
    func saveProduct() async -> Void {
        do {
            let result = try await service.sendProduct(product: product)
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ProductDetailsView(product: storesMock[0].products[0])
}
