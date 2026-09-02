//
//  day19.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 25/06/26.
//

import SwiftUI
//Volume Conversion

enum Volume: String, CaseIterable{
    case litre
    case mililiters
    case cups
    case pints
    case gallons
    
    var toLiters: Double{
        switch self{
        case .litre: return 1
        case .mililiters: return 0.001
        case .cups: return 0.24
        case .pints: return 0.47
        case .gallons: return 3.785
        }
    }
}


struct day19: View {
    
    @State private var mainoption: Volume = .litre
    @State private var volume: Double = 0
    @State private var changeTo: Volume = .cups
    
    var mainoptions = ["Litre", "Mililiters", "Cups", "Pints", "Gallons"]
    
    var resultVolume: Double{
        volume * mainoption.toLiters / changeTo.toLiters
    }
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Input Volume")){
                    TextField("Input Volume: ", value: $volume, format: .number)
                    
                    Picker("Select the unit", selection: $mainoption){
                        ForEach(Volume.allCases, id: \.self){
                            Text($0.rawValue)
                        }                    }
                    
                    
                    
                }
                
                Section(header: Text("Transfer To")){
                    Picker("Select the unit", selection: $changeTo){
                        ForEach(Volume.allCases, id: \.self){x in
                            Text(x.rawValue)
                        }
                    }
                }
                
                Section(header: Text("Result")){
                    Text(String(format: "%.2f", resultVolume))                }
                
                .navigationTitle("Volume Conversion App")
                
            }
        }
    }
}

#Preview {
    day19()
}
