//
//  ProductDetailQuantityView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 04/05/24.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    @Binding var productQuantity: Int
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Quantidade")
                .font(.title3)
                .bold()
            
            HStack {
                Button(action: {
                    if productQuantity > 0 {
                        productQuantity -= 1
                    }
                }, label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .bold()
                })
                
                Text("\(productQuantity)")
                    .font(.title)
                    .bold()
                
                Button(action: {
                    productQuantity += 1
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .bold()
                })
            }
        }
    }
}

#Preview {
    ProductDetailQuantityView(productQuantity: .constant(0))
}
