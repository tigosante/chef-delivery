//
//  StoreDetailsView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 29/04/24.
//

import SwiftUI

struct StoreDetailsView: View {
    let store: StoreType
    @Environment(\.presentationMode) var presetationMode
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Image(store.headerImage)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    Text(store.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    Spacer()
                    
                    Image(store.logoImage)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                
                HStack {
                    Text(store.location)
                    
                    Spacer()
                    
                    ForEach(1...store.stars, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                
                Text("Produtos")
                    .font(.title2)
                    .bold()
                    .padding()
                
                ForEach(store.products) { product in
                    Button(action: {
                        selectedProduct = product
                    }, label: {
                        HStack(spacing: 8) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(product.name)
                                    .bold()
                                
                                Text(product.description)
                                    .foregroundColor(.black.opacity(0.5))
                                    .multilineTextAlignment(.leading)
                                
                                Text(product.formattedPrice)
                            }
                            
                            Spacer()
                            
                            Image(product.image)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                                .frame(width: 120, height: 120)
                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.3), radius: 20, x: 6, y: 8)
                        }
                        .padding()
                        .foregroundColor(.black)
                    }
                    ).sheet(item: $selectedProduct) { product in
                        ProductDetailsView(product: product)
                    }
                }
            }
            .navigationTitle(store.name)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presetationMode.wrappedValue.dismiss()
                    }, label: {
                        HStack(spacing: 4) {
                            Image(systemName: "cart")
                            Text("Lojas")
                        }
                        .foregroundColor(Color("ColorRed"))
                    })
                }
            }
        }
    }
}

#Preview {
    StoreDetailsView(store: storesMock[0])
}
