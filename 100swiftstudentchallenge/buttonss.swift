//
//  buttonss.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 16/07/26.
//
import SwiftUI

struct buttonss: View {
    @Binding var count: Int
    var body: some View {
        Text("Text \(count)")
        HStack{
            Button("-"){
                count -= 1
            }
            
            Button("+"){
                count += 1
            }
            
        }
        .font(.title)
    }
}
