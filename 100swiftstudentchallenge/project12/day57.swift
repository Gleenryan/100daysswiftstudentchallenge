//
//  day57.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 03/09/26.
//

import SwiftUI
import SwiftData

@Model
class User3 {
    var name: String
    var city: String
    var joinDate: Date

    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}





struct day57: View {
    @Environment(\.modelContext) var modelContext
//    @Query(sort: \User3.name) var users: [User3]
    @State private var showingUpcomingOnly = false
    @Query(filter: #Predicate<User3> { user in
        user.name.contains("R")
    }, sort: \User3.name) var users: [User3]
    
    @State private var path = [User3]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User3.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Button("Add User", systemImage: "plus") {
                    let user = User3(name: "", city: "", joinDate: .now)
                    modelContext.insert(user)
                    path = [user]
                }
            }
        }
        
    }
}


#Preview {
    day57()
}
