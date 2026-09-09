//
//  pictCibility.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 09/09/26.
//

import SwiftUI


struct day74: View {
    
    let pictures = [
        "apollo7",
        "apollo8",
        "apollo9"
    ]
    
    let labels = [
        "apollo7",
        "apollo8",
        "apollo9"
    ]
    
    
    @State private var selectedPicture: Int = Int.random(in: 0...2)

    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPicture = Int.random(in: 0...2)
            }
            .accessibilityLabel(labels[selectedPicture])
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
        
        VStack{
            Text("Your score is")
            Text("100")
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("your score is \(selectedPicture)")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                selectedPicture += 1
            case .decrement:
                selectedPicture -= 1
            default:
                print("Not handled.")
            }
        }
        
        //accesibility is like a whole new different world and things that can be handled and taken care off.
    }
}



#Preview {
    day74()
}
