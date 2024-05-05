//
//  StoreDetailsView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 29/04/24.
//

import SwiftUI

struct StoresDetailsView: View {
    let store: StoreType
    @Environment(\.presentationMode) var presetationMode
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                StoresDetailHeaderView(store: store)
                StoresDetailProductsView(store: store)
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
    StoresDetailsView(store: storesMock[0])
}
