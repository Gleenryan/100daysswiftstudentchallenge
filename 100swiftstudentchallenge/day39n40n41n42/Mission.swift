//
//  Mission.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 29/08/26.
//
import Foundation

//you can make a nested struct
struct Mission: Codable, Identifiable, Hashable {
    struct CrewRole: Codable, Hashable{
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
