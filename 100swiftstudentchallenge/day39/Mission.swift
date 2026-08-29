//
//  Mission.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 29/08/26.
//
import Foundation

//you can make a nested struct
struct Mission: Codable{
    struct CrewRole: Codable{
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: String?
    let rew: [CrewRole]
    let description: String
}
