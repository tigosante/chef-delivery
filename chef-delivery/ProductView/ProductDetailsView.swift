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
            VStack(alignment: .leading, spacing: 16) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 20)
                
                Text(product.name)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                
                Text(product.description)
                    .padding(.horizontal)
                
                Text(product.formattedPrice)
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
            }
            
            Spacer()
            
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
            
            Spacer()
            
            Button(action: {
//                
            }, label: {
                HStack {
                    Image(systemName: "cart")
                        .foregroundColor(.white)
                    
                    Text("Adicionar ao carrinho")
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .font(.title3)
                .background(Color("ColorRed"))
                .foregroundColor(.white)
                .cornerRadius(32)
                .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
            })
        }
    }
}

#Preview {
    ProductDetailsView(product: storesMock[0].products[0])
}
