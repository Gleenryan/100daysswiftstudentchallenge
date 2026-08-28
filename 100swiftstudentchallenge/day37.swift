//
//  day37.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 28/08/26.
//
import SwiftUI

//intinya Identifiable itu nandain kalo STRUCT INI BISA UNIQUE, BEDA", HARUS ADA ID
struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses{
    var items = [ExpenseItem](){
        //didSet -> propertyobserver, every changes happen, it will run the didset code inside
        didSet{
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    //init happen once only when expenses class are created
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
            }
        }
    }
    
    
}


struct day37: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    
    
    var body: some View {
        NavigationStack {
            Text("Personal")
            List{
                ForEach(expenses.items.filter{$0.type.contains("Personal")}, id: \.id){ item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("\(item.amount, specifier: "%.2f")")
                            .foregroundStyle(item.amount < 10 ? .green : item.amount < 100 ? .yellow : .red)
                            
                    }
                }
                .onDelete(perform: removeItems)
            }
           
            Text("Bsiness")
            List{
                ForEach(expenses.items.filter{$0.type.contains("Business")}, id: \.id){ item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("\(item.amount, specifier: "%.2f")")
                            .foregroundStyle(item.amount < 10 ? .green : item.amount < 100 ? .yellow : .red)
                            
                    }
                }
                .onDelete(perform: removeItems)
            }
            
            
            .navigationTitle("tracker")
            .toolbar{
                Button("Add"){
                    showingAddExpense.toggle()
                }
            }
            .sheet(isPresented: $showingAddExpense){
                day37b(expenses: expenses)
            }
            
        }
    }
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    day37()
}
