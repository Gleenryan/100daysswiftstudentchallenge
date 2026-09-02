//
//  day32.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 24/07/26.
//

import SwiftUI


struct day32: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me") {
            if animationAmount > 1 {
                animationAmount -= 1
            }else{
                
                animationAmount += 1
            }
        }
        
        .padding(50)
//        .tint(.red)
        
        .background(.red)
        .glassEffect()
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: animationAmount - 1 * 3)
//        .animation(.default, value: animationAmount)
        .animation(.easeInOut(duration: 2)
            .delay(1)
//            .repeatForever()
            .repeatCount(3, autoreverses: true)
                   , value: animationAmount)
        //animasi ada banyak, linear, dll
        
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
        )
        .onAppear {
            animationAmount = 2
        }
        
        
        Button("Tap Me") {
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
                }
                .padding(50)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
        
        
    }
    
    
    
}

#Preview {
    day32()
}
