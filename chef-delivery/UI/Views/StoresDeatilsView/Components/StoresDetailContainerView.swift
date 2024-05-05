//
//  StoresContainerView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 29/04/24.
//

import SwiftUI

struct StoresDetailContainerView: View {
    let stores: [StoreType]
    let title = "Lojas"
    @State private var ratingFilter = 0
    var filteredStores: [StoreType] {
        return stores.filter({ store in store.stars >= ratingFilter })
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Filtrar") {
                    Button {
                        if ratingFilter > 0 {
                            ratingFilter = 0
                        }
                    } label: {
                        Text("Limpar filtro")
                            .foregroundColor(.black)
                    }
                    
                    Divider()
                    
                    ForEach(1...5, id: \.self) { star in
                        Button {
                            ratingFilter = star
                        } label: {
                            let starLabel = star == 1 ? "estrela" : "estrelas"
                            let sufixLabel = star == 5 ? "" : "ou mais"
                            Text("\(star) \(starLabel) \(sufixLabel)")
                                .foregroundColor(.black)
                        }
                    }
                }
                .foregroundColor(.black)
            }
            
            if filteredStores.isEmpty {
                Text("Nenhum resultado encontrado.")
                    .foregroundColor(.accentColor)
                    .font(.title2)
                    .bold()
                    .padding(.vertical, 32)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
            } else {
                VStack(alignment: .leading, spacing: 30) {
                    ForEach(filteredStores) { store in
                        NavigationLink {
                            StoresDetailsView(store: store)
                        } label: {
                            StoresDetailItemView(store: store)
                        }
                        .foregroundColor(.black)
                    }
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    StoresDetailContainerView(stores: storesMock)
}
