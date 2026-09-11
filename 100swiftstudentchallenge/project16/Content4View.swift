//
//  Content4View.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 11/09/26.
//

import SwiftUI

struct Content4View: View {
    var body: some View {
        Text("DUARRR")
        TabView{
            ProspectsView(filter: .none)
                .tabItem{
                    Label("Everyone", systemImage: "swift")
                }
            ProspectsView(filter: .contacted)
                .tabItem{
                    Label("contacted", systemImage: "swift")
                }
            ProspectsView(filter: .uninterupted)
                .tabItem{
                    Label("Uninterupted", systemImage: "swift")
                }
            
        }

    }
}

#Preview {
    Content4View()
}
