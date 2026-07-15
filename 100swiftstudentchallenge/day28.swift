//
//  day28.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 15/07/26.
//


import SwiftUI
import CoreML

struct day28: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 7.5
    @State private var coffeeAmount = 1
    
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showingAlert: Bool = false
    
    static var defaultWakeTime: Date{
        var components = DateComponents()
        components.hour = 5
        components.minute = 00
        return Calendar.current.date(from: components) ?? .now
    }
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section(){
                    Text("When do you want to wake up?")
                        .font(.title2)
                    
                    DatePicker("Please enter time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    
                }
                VStack(alignment: .leading){
                    
                    Text("Desired amount of sleep")
                        .font(.title2)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                
                Text("Daily coffee intake")
                    .font(.title2)
                
                Picker("Halo", selection: $coffeeAmount){
                    ForEach(1...12, id: \.self){
                        Text("\($0)")
                    }
                }
                
                Stepper(coffeeAmount == 1 ? "1 cup" :"\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                    .navigationTitle("Better Rest")
                    .toolbar{
                        Button("Calculate"){
                            calculateBedTime()
                        }
                    }
                
                Section{
                    Text("Your Ideal bedtime is")
                        .font(.title)
                    
                    Text(calculateBedTime2)
                    
                }
                
//                Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
            
            
            
            
            
            
        }
        
        
        
        
    }
    func calculateBedTime(){
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour+minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = "\(sleepTime.formatted(date: .omitted, time: .shortened))"
            showingAlert = true
            
            
            
            
            
        } catch{
            
        }
        
    }
    
    var calculateBedTime2:String{
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour+minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            
            alertMessage = "\(sleepTime.formatted(date: .omitted, time: .shortened))"
            return "\(sleepTime.formatted(date: .omitted, time: .shortened))"
            
            
            
            
            
        } catch{
            return alertMessage
        }
        
    }
}







#Preview {
    day28()
}

