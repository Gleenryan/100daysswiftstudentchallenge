//
//  BookwormApp.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 02/09/26.
//

import SwiftUI
import SwiftData


struct BookwormView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    @State private var showingAddScreen = false
    
    

    
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(books){ book in
                    NavigationLink(value: book){
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                                Text(book.title)
                                                    .font(.headline)
                                                Text(book.author)
                                                    .foregroundStyle(.secondary)
                                            }
                        }
                    }
                    
                }
            }
               .navigationTitle("Bookworm")
               .toolbar {
                   ToolbarItem(placement: .topBarTrailing) {
                       Button("Add Book", systemImage: "plus") {
                           showingAddScreen.toggle()
                       }
                   }
               }
               .sheet(isPresented: $showingAddScreen) {
                   AddBookView()
               }
       }
    }
}



//THIS IS FROM DAY 53
//struct BookwormApp:View {
//    @Environment(\.modelContext) var modelContext
//    @Query var students: [Student2]
//    
//    var body: some View {
//        NavigationStack{
//            List(students) { student in
//                Text(student.name)
//            }
//            .navigationTitle("classroom")
//            .toolbar {
//                Button("Add") {
//                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
//                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
//                    
//                    let chosenFirstName = firstNames.randomElement()!
//                    let chosenLastName = lastNames.randomElement()!
//                    
//                    let student = Student2(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
//                    modelContext.insert(student)
//                }
//            }
//        }
//        
//        
//
//    }
//}


#Preview {
    BookwormView()
}
