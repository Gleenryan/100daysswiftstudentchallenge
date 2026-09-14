////
////  day93b.swift
////  100swiftstudentchallenge
////
////  Created by Gleenryan on 13/09/26.
////
//
//import SwiftUI
//
//struct day93b: View {
//    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
//
//       var body: some View {
//           ScrollView {
//               ForEach(0..<50) { index in
//                   GeometryReader { proxy in
//                       Text("Row #\(index)")
//                           .font(.title)
//                           .frame(maxWidth: .infinity)
//                           .background(colors[index % 7])
//                       //you can play around more on geometry reader  dan bisa bikin banyak cool animationa
//                           .rotation3DEffect(.degrees(proxy.frame(in: .global).minY / 5), axis: (x: 0, y: 1, z: 0))
//                   }
//                   .frame(height: 40)
//               }
//               .scrollTargetLayout()
//           }
//           .scrollTargetBehavior(.viewAligned)
//           //ini bikin yang kayak kalo di web itu jadi persection
//       }
//}
//
//#Preview {
//    day93b()
//}
