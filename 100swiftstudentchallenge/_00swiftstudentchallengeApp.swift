//
//  _00swiftstudentchallengeApp.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 20/06/26.
//

import SwiftUI
import SwiftData

@main
struct _00swiftstudentchallengeApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            Content4View()
                .preferredColorScheme(.dark)
        }
        .modelContainer(for: Prospect.self)
//        .modelContainer(for: User3.self)

        
    }
}
