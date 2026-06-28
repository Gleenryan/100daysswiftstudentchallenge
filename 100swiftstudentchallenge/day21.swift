//
//  day21.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 28/06/26.
//


import SwiftUI

struct day21: View {
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled() // bakal terus ke shuffle
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var totalScore = 0
    @State private var currentRound = 1
    @State private var showEnd = false
    
    @State var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                Text("\(currentRound)/10")
                    .font(.title.weight(.heavy))
                    .foregroundStyle(.white)
                VStack{
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(Color.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                
                            .font(.largeTitle.weight(.bold))
                        
                    }
                    
                    
                    
                    ForEach(0..<3){number in
                        Button{
                            flagTapped(number)
                        }label: {
                            Image(self.countries[number])
                                .clipShape(.circle)
                                .shadow(radius: 5)
                        }
                        
                    }
                    
                }
                .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                    .padding(10)
                
                Spacer()
                Spacer()
                
                Text("Your Score is: \(totalScore)")
                    .foregroundStyle(.white)
                    .font(.largeTitle.weight(.heavy))
            
                
            }
            
            
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Correct answer is flag number \(correctAnswer + 1)")
        }
        .alert("Congrats", isPresented: $showEnd){
            Button("Restart", action: {
                self.totalScore = 0
                self.currentRound = 1
                self.askQuestion()
            })
        } message:{
            Text("Your total score is \(totalScore)")
        }
        
        
        
        
    }
    
    func flagTapped(_ number: Int){//funch harus diluar body
        if number == correctAnswer{
            scoreTitle = "Correct"
            totalScore += 10
        }
        else{
            scoreTitle = "Wrong"
        }
        
        showingScore = true
        currentRound+=1
        if currentRound > 10 {
                showEnd = true
            } else {
                showingScore = true
            }
        
        
    }
    
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

#Preview {
    day21()
}
