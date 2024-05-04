//
//  HomeBlurBackgroundView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 04/05/24.
//

import SwiftUI

struct HomeBlurBackgroundView<Content: View>: View {
    @Binding var isAnimating: Bool
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        GeometryReader { gemotry in
            ZStack {
                Circle()
                    .foregroundColor(.accentColor)
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: isAnimating ? 50 : -50, y: isAnimating ? 100 : -100)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                Circle()
                    .foregroundColor(Color("ColorRedDark"))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(
                        x: isAnimating ? gemotry.size.width - 50 : gemotry.size.width + 50,
                        y: isAnimating ? gemotry.size.height - 50 : gemotry.size.width + 50
                    )
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                content()
            }
        }
    }
}

#Preview {
    HomeBlurBackgroundView(isAnimating: .constant(true)) {
        Text("Teste")
            .font(.title)
            .bold()
    }
}
