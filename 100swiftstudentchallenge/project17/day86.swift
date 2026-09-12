//
//  day86.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 12/09/26.
//

import SwiftUI

struct day86: View {
    @State var currentAmount = 0.0
    @State var finalAmount = 1.0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                
                //if gesture colide, the rule is child first!, but we can sgestureet it if we want with .highpriority
                
                //if want two gesture working together, use SimultaneousGesture
                MagnifyGesture()
                //waktu pinch, ambil value pinchnya
                    .onChanged{ value in
                        currentAmount = value.magnification - 1
                    }
                //kalo udah selesai pinch final amountnya di tambah biar ga balik ke scale awal
                //lalu 0in currentnya lagi
                    .onEnded{ value in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
            
            )
        
        VStack{
            Text("Hello")
            Spacer()
            Text("World")
        }
        .contentShape(.rect)//biar blank juga bisa gesture
        .onTapGesture {
            print("VSTACKKK")
        }
//        .allowsHitTesting(false)
        //buat disable ontap gesture
    }
}

#Preview {
    day86()
}
