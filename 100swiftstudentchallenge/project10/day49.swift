//
//  day49.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 01/09/26.
//

import SwiftUI
internal import System


struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct day49:View {
    @State private var results = [Result]()
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){ image in
//            image
//                .resizable()
//                .scaledToFit()
//        }placeholder:{
//            Color.blue
//        }
//        .frame(width: 200, height: 200)
//        
//        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
//            if let image = phase.image {
//                image
//                    .resizable()
//                    .scaledToFit()
//            } else if phase.error != nil {
//                Text("There was an error loading the image.")
//            } else {
//                ProgressView()
//                //ini loading circle bawaan apple
//            }
//        }
//        .frame(width: 200, height: 200)
        

        
        var disableForm: Bool{
            username.isEmpty || password.isEmpty
        }
        
        Section{
            TextField("USERNAME", text: $username)
            SecureField("Password", text: $password)
    
        }
        
        Button("Login"){
            
        }
        .disabled(disableForm)
        
        
//        List(results, id: \.trackId){ item in
//            VStack(alignment: .leading){
//                Text(item.trackName)
//                    .font(.headline)
//                Text(item.collectionName)
//            }
//        }
//        .task{
//            await loadData()
//        }
    }
        
    
    
    
    
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")
        else{
            print("Invalid URL")
            return
        }
        
        do{
            let(data,_) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                
//                print(decodedResponse.results[1])
                results = decodedResponse.results
            }
            
        } catch{
            print("Invalid data")
        }
    }
}

#Preview {
    day49()
}
