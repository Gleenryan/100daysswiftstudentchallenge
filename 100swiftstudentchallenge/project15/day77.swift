//
//  day77.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 10/09/26.
//

import SwiftUI

struct NonNegative<Value: BinaryInteger>{
    var value: Value
    
    init(wrappedValue: Value){
        if wrappedValue < 0{
            value = 0
        }else{
            value = wrappedValue
        }
        
        var wrappedValue: Value{
            get{value}
            set{
                if newValue < 0{
                    value = 0
                }else{
                    value = newValue
                }
            }
        }
    }
}


struct day77:View {
    var body: some View {
        Text("dsfadasf")
    }
}


#Preview {
    day77()
}
