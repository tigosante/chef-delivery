//
//  HomeView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 04/05/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    @State private var buttonOffset: CGFloat = 0
    @State private var showSecondScreen = false
    
    let buttonHight: CGFloat = 80
    
    var body: some View {
        GeometryReader { geometry in
            HomeBlurBackgroundView(isAnimating: $isAnimating) {
                VStack {
                    HomeHeaderView(isAnimating: $isAnimating)
                    HomeImageView(
                        isAnimating: $isAnimating,
                        imageOffset: $imageOffset
                    )
                    HomeButtonSliderView(
                        isAnimating: $isAnimating,
                        buttonOffset: $buttonOffset,
                        showSecondScreen: $showSecondScreen,
                        geometry: geometry
                    )
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)) {
                        isAnimating = true
                    }
                }
            }.fullScreenCover(isPresented: $showSecondScreen) {
                ContentView()
            }
        }
    }
}

#Preview {
    HomeView()
}
