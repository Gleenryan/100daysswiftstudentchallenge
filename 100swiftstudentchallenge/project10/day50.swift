//
//  day50.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 01/09/26.
//

import SwiftUI

@Observable
class User5: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
        case _description = "description"
    }

    var name = "Taylor"
    var description = "this is a description"
}
struct day50: View {
    @State private var counter = 0
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
        
        Button("Haptic"){
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
        
        //theres a more customizable haptic feedback but i dont really want to learn it so i skip it
        
        
    }

    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User5())
        print(data)
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }}

#Preview {
    day50()
}
