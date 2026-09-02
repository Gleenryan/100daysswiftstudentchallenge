//
//  day52.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 02/09/26.
//

import SwiftUI
import SwiftData

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool

    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]

    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}









struct day53:View {
//    @Environment(\.colorScheme, .dark)
    @State private var rememberMe = false
    @State private var text: String = ""

    var body: some View {
//        VStack {
//            PushButton(title: "Remember Me", isOn: $rememberMe)
//            Text(rememberMe ? "On" : "Off")
//        }
        
        NavigationStack{
            TextField("Enter your text", text: $text, axis: .vertical)
            //if we give axis, it can expand
                .textFieldStyle(.roundedBorder)
        }
        
        
    }
}




#Preview {
    day53()
}
