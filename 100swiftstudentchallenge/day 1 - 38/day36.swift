//
//  day36.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 24/08/26.
//

import SwiftUI

//observable is very efficient, but it don;t change something insidle the class
@Observable
class User{
    var firstName = "Bilbo"
    var lastName = "bagins"
}
//struct itu unique, usually reserved for one thing
struct secondsheet: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("Hello, World!")
        Button("Dismiss"){
            dismiss()
        }
    }
}


//Native navstack and list combo
struct day36: View {
    @State private var show: Bool = false
    @State private var user = User()
    
    @State private var numbers = [Int]()
    @State private var currentNumber: Int = 1
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(numbers, id: \.self){
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add number"){
                    numbers.append(currentNumber)
                    currentNumber += 1
                    
                    UserDefaults.standard.set(numbers, forKey: "numbers")
                }
            }
            .toolbar{
                EditButton()
            }
        }
        
        
//        VStack{
//            Text("halo nama aku \(user.firstName) \(user.lastName)")
//            TextField("Nama Depan", text: $user.firstName)
//            TextField("Nama Belakang", text: $user.lastName)
//            
//            Button("show sheet"){
//                show.toggle()
//            }
//            .sheet(isPresented: $show, content: {
//                secondsheet()
//            })
//        }
    }
    func removeRows(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
}


#Preview {
    day36()
}

//appstorage vs userdefaults -> app storage always refresh ui if the value changed, while userdefaults don't, just use app storage if working with swiftUI

//codeable --> archiving and unarchiving data
