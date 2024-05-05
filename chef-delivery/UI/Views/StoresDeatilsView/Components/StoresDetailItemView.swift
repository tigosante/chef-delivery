//
//  StoreItemView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 29/04/24.
//

import SwiftUI

struct StoresDetailItemView: View {
    let store: StoreType
    
    var body: some View {
        let imageSize = CGFloat(50)
        HStack() {
            Image(store.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(imageSize / 2)
                .frame(width: imageSize, height: imageSize)
            Text(store.name)
                .font(.subheadline)
            Spacer()
        }
    }
}

#Preview {
    StoresDetailItemView(store: storesMock[0])
}
