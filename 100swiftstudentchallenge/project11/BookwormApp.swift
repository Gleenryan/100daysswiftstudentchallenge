//
//  BookwormApp.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 02/09/26.
//

import SwiftUI
import SwiftData

struct BookwormApp:View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student2]
    
    var body: some View {
        NavigationStack{
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student2(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
        }
        
        

    }
}


#Preview {
    BookwormApp()
}
