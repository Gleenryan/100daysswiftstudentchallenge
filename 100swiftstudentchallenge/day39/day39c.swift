//
//  day39c.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 29/08/26.
//

import SwiftUI


struct day39c: View {
    
    let astronatus = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text(String(astronatus.count))
    }
}

#Preview {
    day39c()
}
