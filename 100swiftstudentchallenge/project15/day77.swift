//
//  day77.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 10/09/26.
//

import SwiftUI

@propertyWrapper
struct NonNegative<Value: BinaryInteger> {
    private var value: Value
    
    init(wrappedValue: Value) {
        self.value = wrappedValue < 0 ? 0 : wrappedValue
    }
    
    var wrappedValue: Value {
        get { value }
        set { value = newValue < 0 ? 0 : newValue }
    }
}

struct BankAccount {
    @NonNegative var balance: Int = 100
}




struct day77:View {
    @State private var account = BankAccount()
    
    var body: some View {
//        print(account.balance) // 100

        Button("-50"){
            account.balance -= 50
        }
        Button("+50"){
            account.balance += 50
        }
        Text(String(account.balance))
//        print(account.balance) // 0
    }
}


#Preview {
    day77()
}
