//
//  day25.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 08/07/26.
//

import SwiftUI

struct day25: View {
    
    var module = ["Rock", "Paper", "Scissors"]
    
    var condition = ["Win", "Lose", "Tie"]
    
    @State var appChosen: Int = Int.random(in: 0...2)
    
    @State var gameCondition: Int = Int.random(in: 0...2)
    
    @State var playerScore: Int = 0
    @State var hasAnswered: Bool = false
    @State var playerChoice: Int = 0
    
    func checkCorrect(input:Int) -> Bool{
        if (gameCondition == 0){
            return input == (appChosen + 1) % 3
        }
        else if (gameCondition == 1){
            return input == (appChosen + 2) % 3
            
        }else{
            return input == appChosen
        }
        
    }
    
    func judge(input:Int){
        playerScore += checkCorrect(input: input) ? 1 : -1
        nextRound()
    }
    
    func nextRound() {

        appChosen = Int.random(in: 0...2)

        gameCondition = Int.random(in: 0...2)

    }
    
    var body: some View {
        
        
        VStack{
            Text("Player Score")
                .font(.title3)
            
            Text("\(playerScore)")
            Text("App Choose")
            Text(module[appChosen])
                .font(Font.title.bold())
            Text("YOU MUST")
                .font(.title)
            Text(condition[gameCondition])
                .font(Font.title.bold())
            Spacer()
            
            HStack{
                Button{
                    judge(input:0)
                    
                }label: {
                    Text("ROCK")
                        .font(.title)
                        .bold(true)
                        .padding(5)
                }
                .buttonStyle(.borderedProminent)
                
                
                Button{
                    judge(input: 1)
                }label: {
                    Text("PAPER")
                        .font(.title)
                        .bold(true)
                        .padding(5)
                }
                .buttonStyle(.borderedProminent)
                
                Button{
                    judge(input:2)
                }label: {
                    Text("SCISSORS")
                        .font(.title)
                        .bold(true)
                        .padding(5)
                }
                .buttonStyle(.borderedProminent)
            }
            
            Spacer()
        }
    }
}




#Preview {
    day25()
}
