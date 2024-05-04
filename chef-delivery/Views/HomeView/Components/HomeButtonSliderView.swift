//
//  HomeButtonSliderView.swift
//  chef-delivery
//
//  Created by Tiago Silva on 04/05/24.
//

import SwiftUI

struct HomeButtonSliderView: View {
    @Binding var isAnimating: Bool
    @Binding var buttonOffset: CGFloat
    @Binding var showSecondScreen: Bool
    
    let geometry: GeometryProxy
    private let buttonHight: CGFloat = 80
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(.accent.opacity(0.2))
            Capsule()
                .fill(.accent.opacity(0.2))
                .padding(8)
            
            Text("Descubra mais")
                .font(.title2)
                .bold()
                .foregroundColor(Color("ColorRedDark"))
                .offset(x: 20)
            
            HStack {
                Capsule()
                    .fill(.accent)
                    .frame(width: buttonOffset + buttonHight)
                Spacer()
            }
            
            HStack {
                ZStack {
                    Circle()
                        .fill(.accent)
                    Circle()
                        .fill(Color("ColorRedDark"))
                        .padding(8)
                    
                    Image(systemName: "chevron.right.2")
                        .font(.system(size: 24))
                        .bold()
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .offset(x: buttonOffset)
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        let width = gesture.translation.width
                        
                        if width >= 0 && width <= (geometry.size.width - 60 - buttonHight){
                            buttonOffset = gesture.translation.width
                        }
                    })
                    .onEnded({ _ in
                        if buttonOffset > ((geometry.size.width - 60)  / 2) {
                            showSecondScreen = true
                        } else {
                            withAnimation(.easeInOut(duration: 0.25)
                            ) {
                                buttonOffset = 0
                            }
                        }
                    })
            )
        }
        .frame(
            width: isAnimating ? geometry.size.width - 60 : 200,
            height: buttonHight)
        .opacity(isAnimating ? 1 : 0)
        .blur(radius: isAnimating ? 0 : 10)
        .offset(y: isAnimating ? 0 : 150)
    }
}

#Preview {
    GeometryReader { geometry in
        HomeButtonSliderView(
            isAnimating: .constant(true),
            buttonOffset: .constant(.zero),
            showSecondScreen: .constant(false),
            geometry: geometry
            
        )
    }
}
