//
//  Day62.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 04/09/26.
//

import SwiftUI

struct Day62: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white

    var body: some View {
        Button("Hello, World!") {
            showingConfirmation = true
        }
        .frame(width: 300, height: 300)
        .background(backgroundColor)
        //like alert but from bellow
        .confirmationDialog("Change Background", isPresented: $showingConfirmation){
            Button("Red"){backgroundColor = .red}
            Button("Green") { backgroundColor = .green }
                Button("Blue") { backgroundColor = .blue }
                Button("Cancel", role: .cancel) { }
            
        } message: {
            Text("Select a new color")
        }
    }
        
}


#Preview {
    Day62()
}
