//
//  day16.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 22/06/26.
//

//Form

import SwiftUI

struct day16: View {
    @State var tapCount = 1 // harus diluar body biar jadi variabel global
    //state biar bisa diedit freely
    @State private var name: String = ""
    let students = ["a", "b", "charlie"]
    @State private var selected = "a"
    
    var body: some View {
        
        NavigationStack{
            Button("tapped: \(tapCount)"){
                tapCount += 1
            }
            Form{
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
                
                TextField("Enter your name", text: $name)//$ biar keupdate terus
                Text(name)
                
                Picker("Select your student", selection: $selected){
                    ForEach(students, id: \.self){//.self ini to identify every view
                        Text($0)
                    }
                }
                
                
                Section{
                    Text("Hey")
                }
            }.navigationTitle("This is Nav title")
                .navigationBarTitleDisplayMode(.inline) // bisa inline bisa large
            
        }
        
    }
}

#Preview {
    day16()
}
