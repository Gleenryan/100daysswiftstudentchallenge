//
//  Day96.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 14/09/26.
//
//for searchable i already know


import SwiftUI

struct people: Identifiable{
    var id = "YUHU"
}

@Observable
class Player{
    var duar = 0
}

struct Day96: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    
    @State private var player1 = Player()
    @State private var user: people? = nil
    var body: some View {
        
        if horizontalSizeClass == .compact{
            Text("Ehh space so small la")
        }
        ViewThatFits {
            //bakal urut dari atas nyobain cukup atau ngga, kalo ngga coba versi bawahnya
            
            Text("Shorter description")
            Text("This is a very long description that might not fit")
            Text("Short")
        }
        
        Button("Tap"){
            user = people()
        }
        .environment(player1) // kita bisa semacem inject user ini nanti kedalam" childnya button ini
        .sheet(item: $user){ user in
            Text(user.id)
                .presentationDetents([.medium, .large])
            
        }
    }
}

#Preview {
    Day96()
}
