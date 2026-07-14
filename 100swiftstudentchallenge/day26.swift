//
//  day26.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 14/07/26.
//

import SwiftUI

struct day26: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    
    
    
    var body: some View {
        
        // MARK: - Belajar stepper
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.2)
            .padding()
        //bisa dikasi batas, bisa dikasi step
        
        
        DatePicker("This is DatePicker title", selection: $wakeUp)
//            .labelsHidden()
        //bisa pake labelsHidden() buat ngilangin title.
        
        DatePicker("You can set the displayed components", selection: $wakeUp,in: Date.now..., displayedComponents: .date)
        //bisa dilimit juga
        
        DatePicker("You can set the displayed components", selection: $wakeUp,in: ...Date.now, displayedComponents: .date)
        
        Text(Date.now, format: .dateTime.day().month().year())
        Text(Date.now.formatted(date:.long, time: .shortened))
        
        
        
        
        
    }
    
    func exampleDates(){
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
    }
    
}


#Preview {
    day26()
}
