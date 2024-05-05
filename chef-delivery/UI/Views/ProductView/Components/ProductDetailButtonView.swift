//
//  ProductDetailButtonView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 04/05/24.
//

import SwiftUI

struct ProductDetailButtonView: View {
    var onButtonPressed: () -> Void
    
    var body: some View {
        Button {
            onButtonPressed()
        } label: {
            HStack {
                Image(systemName: "cart")
                    .foregroundColor(.white)
                
                Text("Enivar pedido")
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .font(.title3)
            .background(Color("ColorRed"))
            .foregroundColor(.white)
            .cornerRadius(32)
            .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
        }
    }
}

#Preview {
    ProductDetailButtonView {
//
    }
}
