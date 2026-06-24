//
//  day18.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 24/06/26.
//


import SwiftUI

struct day18:  View {
    @State var checkAmount = 10000
    @State var totalPeople = 5
    @State var tipPercentage: Double = 10
    @FocusState var isFocused: Bool
    let tipPercentages = [10,20,30,40,50]
    
    var totalPerPerson: Double {
        let total = Double(checkAmount) + tipAmount
        return total / Double(totalPeople)
    }
    
    var tipAmount: Double {
        Double(checkAmount) * tipPercentage / 100
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: "IDR"))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    //format itu ada banyak
                    //.number, .currency, .datetime, .percent, dll
                    
                    
                    Picker("People", selection: $totalPeople) {
                        ForEach(1...100, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                }
                Section("Give some tips") {
                    Text("\(Int(tipPercentage))%")
//                    Picker("Tip", selection: Binding(
//                        get: { Int(tipPercentage) },
//                        set: { tipPercentage = Double($0) }
//                    )) {
//                        ForEach(tipPercentages, id: \.self) { value in
//                            Text(value, format: .percent)
//                        }
//                    }
//                    .pickerStyle(.segmented)

                    Slider(
                        value: $tipPercentage,
                        in: 0...100,
                        step: 1
                    )
                }
                Section("Total"){
                    Text("\(checkAmount) + \(Int(tipAmount)) = \(checkAmount + Int(tipAmount))")
                }
                Section("Amount per Person"){
                    Text("Total per person: \(totalPerPerson, format: .currency(code: "IDR"))")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if isFocused{
                    Button("Done"){
                        isFocused.toggle()
                    }
                }
            }
            
        }
    }
}


#Preview {
    day18()
}
