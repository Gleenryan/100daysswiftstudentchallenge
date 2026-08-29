//
//  day39b.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 29/08/26.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text("\(text)")
            .font(.title)
            .bold()
    }
    
    init(text: String) {
        self.text = text
    }
}


struct day39b: View {
    //grid can take up space as it needs and dynamic
    let layout = [
        GridItem(.adaptive(minimum: 50, maximum: 120)),
    ]
    
    var body: some View {
//        ScrollView {
//            //lazy is just the same like lazy loading in web
//            //lazy also take up as big screen as they can
//            LazyVStack{
//                ForEach(0..<100) {
//                    CustomText(text: "Item  \($0)")
//                        .font(.title)
//                    //                    .frame(width: .)
//                }
//                
//            }
//            .frame(maxWidth: .infinity)
//        }
        
        NavigationStack{
            NavigationLink("tap me"){
                Text("Hello")
            }
            .navigationTitle("TITLE")
        }
        
    }
}


#Preview {
    day39b()
}
