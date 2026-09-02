//
//  day17.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 23/06/26.
//
import SwiftUI

struct day17:  View {
    @State var checkAmount = 10000
    @State var totalPeople = 5
    @State var tipPercentage = 10
    @FocusState var isFocused: Bool
    let tipPercentages = [10,20,30,40,50]
    
    var totalPerPerson: Double {
        let tip = checkAmount * tipPercentage / 100
        let total = checkAmount + tip
        return Double(total) / Double(totalPeople)
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
                    Picker("Tip", selection: $tipPercentage){
                        ForEach(tipPercentages, id:\.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Text("Total per person: \(totalPerPerson, format: .currency(code: "IDR")).00")
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
    day17()
}
