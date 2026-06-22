//
//  day1.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 20/06/26.
//

//Why Swift? safe language

//var -> changeable
//let -> constant

//Third, Swift decides whether you wanted to create a Double or an Int based on the number you provide – if there’s a dot in there, you have a Double, otherwise it’s an Int. Yes, even if the numbers after the dot are 0.




import SwiftUI




struct day1: View {
    var pep1 = "Hello, World!"
    let pep = "phi"
    let des = 0.0 // this will be decimal automatically
//    pep1 = "1.618"
    //for number you can do this
    let number1 = 1_000_000
    
        var body: some View {
            

            Text(String(number1))
            Text(String(number1.isMultiple(of: 2)))
        
    }
}

#Preview {
    day1()
}
