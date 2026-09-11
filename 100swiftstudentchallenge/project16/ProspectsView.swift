//
//  ProspectsView.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 11/09/26.
//
import CodeScanner
import SwiftUI
import SwiftData
internal import AVFoundation

struct ProspectsView: View {
    
    enum filterType{
        case none, uninterupted, contacted
    }
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @State private var isShowingScanner = false
    @State private var selectedProspects = Set<Prospect>()
    
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
            List(prospects, selection: $selectedProspects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
                .tag(prospect)
                .swipeActions{
                    if prospect.isContacted{
                        Button("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark") {
                                    prospect.isContacted.toggle()
                                }
                                .tint(.blue)
                    }else{
                        Button("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark") {
                                   prospect.isContacted.toggle()
                               }
                               .tint(.green)
                    }
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        modelContext.delete(prospect)
                    }
                }
            }
                .navigationTitle(title)
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Scan", systemImage: "swift"){
                            isShowingScanner = true
                        }
                        
                    }
                    
                    ToolbarItem(placement: .topBarLeading){
                            EditButton()
                    }
                    
                    if selectedProspects.isEmpty == false{
                        ToolbarItem(placement: .bottomBar){
                            Button("Delete"){
                                delete()
                            }
                        }
                    }
                }
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
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
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }

            let person = Prospect(name: details[0], emailAddress: details[1], isContacted: false)

            modelContext.insert(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
    func delete(){
        for prospect in selectedProspects {
            modelContext.delete(prospect)
        }
    }
    
}

#Preview {
    ProspectsView(filter: .none)
}
