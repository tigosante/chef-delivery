//
//  HomeHeaderView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 04/05/24.
//

import SwiftUI

struct HomeHeaderView: View {
    @Binding var isAnimating: Bool
    
    var body: some View {
        VStack {
            HomeSlideAnimationView(isAnimating: $isAnimating) {
                Text("Chef Delivery")
                    .font(.system(size: 48))
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                    .blur(radius: isAnimating ? 0 : 10)
            }
            
            HomeSlideAnimationView(isAnimating: $isAnimating) {
                Text("Peça as suas comidas no conforto da sua casa")
                    .font(.title2)
                    .bold()
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.7))
                    .blur(radius: isAnimating ? 0 : 10)
            }
        }
    }
}

#Preview {
    HomeHeaderView(isAnimating: .constant(true))
}
