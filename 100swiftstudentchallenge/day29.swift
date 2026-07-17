//
//  day29.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 17/07/26.
//

import SwiftUI

struct day29:View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    //MARK: working with string
    //intinya ini hal" yg bisa dilakuin tapi harus pake beberapap objective c, bahasa apple yg lama
    func testStrings(){
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        let letters2 = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
    }

    
    var body: some View {
        //MARK: - List bisa dynamic maupun static
        List {
            Text("Static row 1")
            Text("Static row 2")

            ForEach(0..<5) {
                Text("Dynamic row \($0)")
            }

            Text("Static row 3")
            Text("Static row 4")
        }
        .listStyle(.sidebar) //type juga macem"
        
        //bisa dibikin semacem foreach juga
        List(people, id: \.self) {
                    Text($0)
                }
        
        
            }
    //MARK: cara read bundle / file
    func testBundle(){
        if let fileContents = try? String(contentsOfFile: "test.txt", encoding: .utf8) {
            
        }
    }
    
    
    
    
    
    

}

#Preview {
    day29()
}
