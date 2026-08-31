//
//  day43.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 31/08/26.
//

import SwiftUI

struct Student{
    var id = UUID()
    var name: String
    var age: Int
}


struct day43: View {
    var body: some View {
        NavigationStack {
            List(0..<100){ i in
                var x = i+1
                NavigationLink("NUmber \(i)", value: i)
                NavigationLink("This is x \(x)", value: x)
                    
            }
            .navigationDestination(for: Int.self){
                selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    day43()
}
