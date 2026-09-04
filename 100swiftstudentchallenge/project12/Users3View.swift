//
//  Users3View.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 04/09/26.
//
import SwiftUI
import SwiftData

struct Users3View:View {
    @Query var users: [User3]
    
    var body: some View {
        List(users){ user in
            Text(user.name)
            
        }
    }
    
    init(minimumJoinDate: Date){
        _users = Query(filter: #Predicate<User3>{ user in
            user.joinDate >= minimumJoinDate
        }, sort: \User3.name)
    }
    
}

#Preview {
    Users3View(minimumJoinDate: .now)
        .modelContainer(for: User3.self)
}
