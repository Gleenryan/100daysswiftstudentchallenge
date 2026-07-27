//
//  day33.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 27/07/26.
//

import SwiftUI

struct day33:View {
    @State var enabled:Bool = false
    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false
    @State private var isShowingRed2 = false
    
    var body: some View {
        Button("Tap me"){
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .red : .green)
        .foregroundStyle(.white)
        .animation(.default, value: enabled)
        
        //order di animationpun juga ngaruh
        //animation bisa semacem dipisah gitu
        
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 0.5, bounce: 0.8), value: enabled)
        
        
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 300, height: 200)
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount = $0.translation }
//                            .onEnded { _ in dragAmount = .zero }
                        //ini animasi cuma waktu end
                            .onEnded { _ in
                                withAnimation(.bouncy) {
                                    dragAmount = .zero
                                }
                            }
                    )
//                    .animation(.bouncy, value: dragAmount)
                    
        //MARK: - TRANSITION
        VStack {
                   Button("Tap Me") {
                       withAnimation{
                           isShowingRed.toggle()
                       }
                       
                   }

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
//                    .transition(.scale)
                //bisa dipakein transition, tapi harus ada withAnimation modifier diatas
                
                //bisa juga kalo pas muncul beda, dihapus beda transition
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
               }
        
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)

            if isShowingRed2 {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
                    withAnimation {
                        isShowingRed2.toggle()
                    }
                }
        
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}


#Preview {
    day33()
}
