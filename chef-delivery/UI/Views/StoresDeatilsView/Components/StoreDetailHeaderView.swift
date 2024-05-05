//
//  StoreDetailHeaderView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 04/05/24.
//

import SwiftUI

struct StoresDetailHeaderView: View {
    let store: StoreType
    
    var body: some View {
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
    }
}

#Preview {
    StoresDetailHeaderView(store: storesMock[0])
}
