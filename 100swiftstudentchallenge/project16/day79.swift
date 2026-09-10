//
//  day79.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 10/09/26.
//

import SwiftUI

struct day79: View {
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    @State private var selection = Set<String>()
    @State private var selectedTab = "One"
    
    
    var body: some View {
        TabView{
            Text("1")
                .tabItem{
                    Label("One",systemImage: "star")
                }
                .tag("One")
            
            Text("2")
                .tabItem{
                    Label("two",systemImage: "star").symbolEffect(.pulse)
                }
                .tag("Two")

        }
//        List(users, id:\.self, selection: $selection){user in
//            Text(user)
//        }
//        
//        if selection.isEmpty == false{
//            Text("You have selected \(selection.formatted())")
//            //formatted ini biar bagus tampilannya kalo ditampilin
//        }
//        
//        EditButton()
    }
}


#Preview {
    day79()
}
