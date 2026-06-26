//
//  day20.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 26/06/26.
//

import SwiftUI


//intinya ada v,z,h stack, trust aditionnya ada alignment n spacing
//di dalem stack bisa kasi spacer()

//.ignoresafearea bisa dipakai untuk ignore safe area, cuma pake untuk hal" yg ga berkepentingan seperti background color, etc

//.background(.ultraThinMaterial)
//foregroundStyle -> font color, secondary means little bit transparent

//gradiant thingie-> don't wanna learn too much but they can create better background rather than just blend color background.

//function have to be outside body

struct day20: View {
    @State private var isOn: Bool = false
    var body: some View {
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//
//            Text("Your content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
        
        
        //GRADIENTTTTTT
//        Text("Your content")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .foregroundStyle(.white)
//            .background(.red.gradient)
        
        
        //BUTTON AND IMAGESSSSSSS
        Button("Click me"){
            execute1()
        }
        Button("Click me 2nd version", action: execute1)
        //this 2 worked the same
        
        //there's some default colored
        Button("1"){}
            .buttonStyle(.bordered)
        Button("1"){}
            .buttonStyle(.borderedProminent)
        Button("1", role: .destructive){}
            .buttonStyle(.borderedProminent)
        
        //some cuztomizeable using .tint aswell
        Button("Button 3") { }
            .buttonStyle(.borderedProminent)
            .tint(.mint)
        
        Image("singapore")
        
        //pake label juga bisa instead of ()
        Button{
            execute1()
        }label: {
            Label("Edit", systemImage: "pencil")
                .padding(10)
                .background(.red)
        }
        
        //next alerttttt
        Button("ALERT"){
            isOn = true
        }
        .alert("This is the Title", isPresented: $isOn){
            Button("Delete", role: .destructive){}
            Button("Cancel", role: .cancel){}
        } message: {
            Text("This is message below the title")
        }
     
    }
    func execute1() {
        print("clicked")
    }
}

#Preview {
    day20()
}
