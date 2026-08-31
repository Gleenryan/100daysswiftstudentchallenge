//
//  day44.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 31/08/26.
//


import SwiftUI

@Observable
class PathStore {
    var path: [Int] {
        didSet {//kalo ada perubahan jalanin ini
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
        }

        // Still here? Start with an empty path.
        path = []
    }

    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct day44: View {
    
    @State private var path = NavigationPath()
//    path = NavigationPath //bisa nerima data apa aja
    
    
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                Button("Show 32") {
                    path.append(32)
                }

                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    path.append(32)
                    path.append(64)
                    path.append(128)
                    path.append(256)
                }
//
                
                
                
            }
            .navigationTitle(Text("Day 44"))
            .navigationDestination(for: Int.self){
                selection in
                Text("You selected \(selection)")
                Button("Remove all path") {
                path = NavigationPath()
            }
            }
            .toolbar{
                Button("Remove all path") {
                path.removeLast(path.count)
            }
            }
            
        }
        
        
    }
}

#Preview {
    day44()
}

