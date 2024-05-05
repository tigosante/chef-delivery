//
//  HomeSlideAnimationView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 04/05/24.
//

import SwiftUI

struct HomeSlideAnimationView<Content: View>: View {
    @Binding var isAnimating: Bool
    @ViewBuilder let content: () -> Content

    var body: some View {
        content()
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -40)
    }
}

#Preview {
    HomeSlideAnimationView(isAnimating: .constant(true)) {
        Text("Teste")
    }
}
