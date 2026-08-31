//
//  day39.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 29/08/26.
//

import SwiftUI

struct User1: Codable{
    let name: String
    let address: Address
}

struct Address: Codable{
    let street: String
    let city: String
}

struct day39: View {
    
    var body: some View {
//        Image(.UK)
//            .resizable() // gambar ngikut
//            .scaledToFit() // bakal pakai secukupnya
////            .scaledToFill() // sampe keisi semua pokonya
//            .frame(width: 100, height: 1000)
//            .containerRelativeFrame(.horizontal){
//                size, axis in
//                size * 0.5
//            }
//        
////            .clipped() //motong
//
        
        Button("Tap me"){
            let input = """
                {
                "name":"Johnny",
                "address": {
                    "street": "Hocimin",
                    "city": "Cimini"
                    }
                }
                """
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User1.self, from: data) {
                print(user)
            }
        }
    }
        
        
}

#Preview {
    day39()
}
