//
//  HomeImageView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 04/05/24.
//

import SwiftUI

struct HomeImageView: View {
    @Binding var isAnimating: Bool
    @Binding var imageOffset: CGSize
    
    var body: some View {
        Image("image")
            .resizable()
            .scaledToFit()
            .shadow(radius: 60)
            .opacity(isAnimating ? 1 : 0)
            .padding( isAnimating ? 32 : 0)
            .scaleEffect(isAnimating ? 1 : 1.5)
            .blur(radius: isAnimating ? 0 : 10)
            .offset(x: imageOffset.width, y: imageOffset.height)
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        imageOffset = gesture.translation
                    })
                    .onEnded({ _ in
                        withAnimation(.easeInOut(duration: 0.3)
                        ) {
                            imageOffset = .zero
                        }
                    })
            )
    }
}

#Preview {
    HomeImageView(isAnimating: .constant(true), imageOffset: .constant(.zero))
}
