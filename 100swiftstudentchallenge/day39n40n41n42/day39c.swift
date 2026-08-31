//
//  day39c.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 29/08/26.
//

import SwiftUI


struct day39c: View {
    @State private var path = NavigationPath()
    @State private var tolist = false
    //karena pake generic jadi kita harus jelasin dia tipe datanya apa
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        
        NavigationStack {
            Group{
                
                if tolist {
                    List(missions) { mission in
                    
                        
                        NavigationLink(value: mission){
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 44, height: 44)
                                VStack(alignment: .leading) {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                }
                            }
                        }
                            
                        
//                        NavigationLink {
//                            MissionView(mission: mission, astronauts: astronauts)
//                        } label: {
//                            HStack {
//                                Image(mission.image)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 44, height: 44)
//                                VStack(alignment: .leading) {
//                                    Text(mission.displayName)
//                                        .font(.headline)
//                                    Text(mission.formattedLaunchDate)
//                                        .font(.caption)
//                                }
//                            }
//                        }
                    }
                }else{
                    
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in
                                NavigationLink(value: mission){
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
//                                NavigationLink {
//                                    MissionView(mission: mission, astronauts: astronauts)
//                                } label: {
////                                    
//                                    VStack {
//                                        Image(mission.image)
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 100, height: 100)
//                                        
//                                        VStack {
//                                            Text(mission.displayName)
//                                                .font(.headline)
//                                            Text(mission.formattedLaunchDate)
//                                                .font(.caption)
//                                        }
//                                        .frame(maxWidth: .infinity)
//                                    }
//                                    .padding(.vertical)
//                                    .frame(maxWidth: .infinity)
//                                    .background(.lightBackground)
                                }
                            }
                            
                    }
                    
                    
                }
                    
                
                    
                
                    
                
                
                
                
            }
            .navigationTitle("Moonshot")
                .toolbar{
                    Toggle("To list", isOn: $tolist)
                }
                .navigationDestination(for: Mission.self) { mission in
                    MissionView(mission: mission, astronauts: astronauts)
                }

            
        }
    }
    
}

#Preview {
    day39c()
}
