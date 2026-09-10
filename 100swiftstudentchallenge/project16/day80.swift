//
//  day80.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 10/09/26.
//


import SwiftUI


struct day80: View {
    @State private var output = ""
    @State private var backgroundColor = Color.red
    var body: some View {
        
        VStack {
                    Text("Hello, World!")
                        .padding()
                        .background(backgroundColor)

                    Text("Change Color")
                        .padding()
                        .contextMenu {
                            Button("Red", role: .destructive) {
                                backgroundColor = .red
                            }
                            //context menu color can;t be change, only using ole, even thats for important thing not just to change the color.

                            Button("Green") {
                                backgroundColor = .green
                            }

                            Button("Blue") {
                                backgroundColor = .blue
                            }
                        }
                }
        
        
        
        
//            Text(output)
//                .task {
//                    await fetchReadings()
//                }
//        
//        Image(.bean)
////            .interpolation(.none)
//        //biar image tetep kotak" khususnya kalo buat pixel art
//            .resizable()
//            .scaledToFit()
//            .background(.black)
        }
    
    func fetchReadings() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            
            return "Found \(readings.count) readings"
        }
        let result = await fetchTask.result
        //pake .result ini nampung string resultnya dan error
        
        switch result{
        case .success(let str):
            output = str
        case .failure(let error):
            output = error.localizedDescription
        }

    }
}

#Preview {
    day80()
}
