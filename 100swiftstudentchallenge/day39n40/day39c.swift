//
//  day39c.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 29/08/26.
//

import SwiftUI


struct day39c: View {
    //karena pake generic jadi kita harus jelasin dia tipe datanya apa
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            Text("Detail view")
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)

                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                    }
                }
            }
            .navigationTitle("Moonshot")
        }
    }
}

#Preview {
    day39c()
}
