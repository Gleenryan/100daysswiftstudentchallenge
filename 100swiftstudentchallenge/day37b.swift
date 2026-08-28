//
//  day37b.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 28/08/26.
//

import SwiftUI



struct day37b: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var type: String = ""
    @State private var amount = 0.0
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD")
                    )
                .keyboardType(.decimalPad)
                
                
            }
            .navigationTitle("Add New Expenses")
            .toolbar{
                Button("Add"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}



#Preview {
    day37b(expenses: Expenses())
}
