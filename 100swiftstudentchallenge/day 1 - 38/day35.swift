//
//  day35.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 29/07/26.
//

import SwiftUI

struct day35: View {
    @State private var numberLevel: Int = 2
    @State private var totalLevel: Int = 5
    @State private var isOn: Bool = false
    @State private var answerField: String = ""
    @State private var correctAnswer: Int = 0
    @State private var currentLevel: Int = 1
    
    
    @State private var firstNumber: Int = 1
    @State private var secondNumber: Int = 1
    
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showingAlert: Bool = false
    
    
    var body: some View {
        if isOn {
            game
        }else{
            onBoarding
        }

        
       
    }
    
    
    
    var game: some View {
        VStack{
            Text("Question \(currentLevel)/\(totalLevel)")
            Text("\(firstNumber)x\(secondNumber)").font(.title)
            
            TextField("Answer", text: $answerField)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .onSubmit {
                    checkAnswer()
                    currentLevel+=1
                    checkEndGame()
                }
            
            
        }
        .padding(10)
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Continue")))
        })
    }
    
func checkEndGame(){
        if currentLevel == totalLevel {
            isOn.toggle()
        }
    }
    
    
func checkAnswer(){
        guard let answer = Int(answerField) else {

                return

            }
    if answer == firstNumber*secondNumber {
            correctAnswer += 1
            
            alertTitle = "Correct"
            alertMessage = "\(answerField) is correct"
        }else{
            alertTitle = "Incorrect"
            alertMessage = "\(answerField) is incorrect. The correct answer is \(firstNumber*secondNumber)"
        }
    showingAlert.toggle()
    firstNumber = Int.random(in: 1...12)
    secondNumber = numberLevel
    answerField = ""
    
    }
    
    
    
    var onBoarding: some View {
        
        VStack{
            Text("Multiplication Game")
            Text("\(numberLevel)").font(.largeTitle)
            Stepper("\(numberLevel)", value: $numberLevel, in: 2...12).labelsHidden()
            
            Text("How many Questions?")
            Picker("Value", selection: $totalLevel) {

                Text("5").tag(5)

                Text("10").tag(10)

                Text("20").tag(20)

            }

            .pickerStyle(.segmented)
            
            Button("Start"){
                isOn.toggle()
            }
        }
        .padding(10)
    }
}


#Preview {
    day35()
}
