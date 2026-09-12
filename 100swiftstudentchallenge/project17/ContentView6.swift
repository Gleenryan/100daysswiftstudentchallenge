//
//  ContentView6.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 12/09/26.
//

import SwiftUI

struct ContentView6: View {
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture(count:2){
                print("Double tap")
            }
            .onLongPressGesture(minimumDuration: 2){
                print("Long press")
            }onPressingChanged: { inprogress in
                print(inprogress)
            }
    }
}

#Preview {
    ContentView6()
}
