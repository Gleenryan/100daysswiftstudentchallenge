//
//  day87.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 12/09/26.
//

import SwiftUI
public import Combine

struct day87: View {
    @Environment(\.scenePhase) var scenePhase
    //ada 3, active, inactive, dan background
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    //intinya ada banyak banget accesibility feature dari apple yg bisa diimplement
    
    //tolerance bisa bikin hp lebih hemat karena ga harus precise bgt(boros)
    let timer = Timer.publish(every: 1,tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer){ time in
                if counter == 5{
                    timer.upstream.connect().cancel()
                }else{
                    print("time : \(time)")
                }
                
                counter += 1
            }
            .background(accessibilityDifferentiateWithoutColor ? .black : .green)
    }
}

#Preview {
    day87()
}
