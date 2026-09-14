//
//  ResortView.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 14/09/26.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    @Environment(Favorites.self) var favorites
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0){
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    if horizontalSizeClass == .compact && dynamicTypeSize > .large{
                        VStack(spacing: 10) { ResortDetailsView(resort: resort) }
                        VStack(spacing: 10) { SkiDetailsView(resort: resort) }
                    } else {
                        ResortDetailsView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))
                // i dont care but dont go pass large
                .dynamicTypeSize(...DynamicTypeSize.large)

                Group {
                    Text(resort.description)
                        .padding(.vertical)

                    Text("Facilities")
                        .font(.headline)

                    HStack{
                        ForEach(resort.facilityTypes) { facility in
                            Button {
                                selectedFacility = facility
                                showingFacility = true
                            } label: {
                                facility.icon
                                    .font(.title)
                            }
                        }
                    }                        .padding(.vertical)
                }
                .padding(.horizontal)
                Button(favorites.contains(resort) ? "Remove from Favorite" : "Add to Favorite"){
                    if favorites.contains(resort){
                        favorites.remove(resort)
                    }else{
                        favorites.add(resort)
                    }
                        
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More Information", isPresented: $showingFacility, presenting: selectedFacility){ _ in
        } message: { facility in
            Text(facility.description)
        }
    }
}

#Preview {
    
    ResortView(resort: .example)
        .environment(Favorites())
}
