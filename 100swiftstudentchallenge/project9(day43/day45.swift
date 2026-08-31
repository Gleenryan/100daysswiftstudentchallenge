//
//  day45.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 31/08/26.
//

import SwiftUI


struct day45:View {
    @State private var title = "day45"
    
    
    var body: some View {
        NavigationStack {
            
            Text("\(title)")
            .navigationTitle($title)
            //if we use this, it will be small, centered and can have options like rename
            .navigationBarTitleDisplayMode(.inline)
            
            
            
//            List(0..<100){i in
//                Text("\(i)")
//            }
//            .toolbar{
//                ToolbarItem(placement: .topBarLeading){
//                    Button("hi"){
//                        
//                    }
//                }
//            }
//            .navigationTitle(Text("Day 45"))
//            .toolbarBackground(
//                LinearGradient(
//                    colors: [
//                        .blue.opacity(0.1),
//                        .purple.opacity(0.4)
//                    ],
//                    startPoint: .leading,
//                    endPoint: .trailing
//                )
//            )            .toolbar(.hidden)
        }
    }
        
}


#Preview {
    day45()
}
