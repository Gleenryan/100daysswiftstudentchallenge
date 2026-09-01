//
//  day50b.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 01/09/26.
//

import SwiftUI


struct day50b:View {
    @State private var order = Order()
    
    var body: some View {
        NavigationStack {
            Form{
                Section{
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section{
                    Toggle("Any special req?", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled {
                        Toggle("Add sprinkles?", isOn: $order.addSprinkles)
                        Toggle("Exsta frosting?", isOn: $order.extraFrosting)
                    }
                }
                
                Section{
                    NavigationLink("Delivery details"){
                        AddressView(order: order)
                    }
                }
                
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}



#Preview {
    day50b()
}
