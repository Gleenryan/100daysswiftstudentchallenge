//
//  ContentView3.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 06/09/26.
//
import SwiftUI

struct User4: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    static func <(lhs: User4, rhs: User4) -> Bool{
        lhs.lastName < rhs.lastName
    }
}

struct day68:View {
    let users = [
        User4(firstName: "Arnold", lastName: "Rimmer"),
        User4(firstName: "Kristine", lastName: "Kochanski"),
        User4(firstName: "David", lastName: "Lister"),
    ]
    //cara sorted kalo pake comparable
        .sorted()
    //cara sorted biasa
//        .sorted {
//        $0.lastName < $1.lastName
//    }

    var body: some View {
//        List(users) { user in
//            Text("\(user.lastName), \(user.firstName)")
//        }
        
        Button("Read and write"){
            let data = Data("Test message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do{
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch{
                print(error.localizedDescription)
            }
        }
    }
}


#Preview {
    day68()
}
