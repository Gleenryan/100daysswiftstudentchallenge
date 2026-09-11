//
//  ProspectsView.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 11/09/26.
//

import SwiftUI
import SwiftData

struct ProspectsView: View {
    
    enum filterType{
        case none, uninterupted, contacted
    }
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    
    let filter: filterType
    
    var title: String{
        switch filter {
        case .none:
            "Everyone"
        case .uninterupted:
            "Uncontacted People"
        case .contacted:
            "Contacted People"
        }
    }
    
    var body: some View {
        NavigationStack{
            List(prospects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
            }
                .navigationTitle(title)
                .toolbar{
                    Button("Scan", systemImage: "swift"){
                        let prospect = Prospect(name: "Gleen", emailAdress: "dnfjsdf@gmai;.com", isContacted: false)
                        modelContext.insert(prospect)
                    }
                }
        }
    }
    
    
    init(filter: filterType){
        self.filter = filter
        
        if filter != .none{
            let showContactedOnly = filter == .contacted
            
            _prospects = Query(filter: #Predicate{
                $0.isContacted == showContactedOnly
            }, sort: [SortDescriptor(\Prospect.name)])
            
        }
    }
    
}

#Preview {
    ProspectsView(filter: .none)
}
