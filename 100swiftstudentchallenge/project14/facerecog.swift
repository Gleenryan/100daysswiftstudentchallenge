//
//  facerecog.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 07/09/26.
//

import LocalAuthentication
import SwiftUI

struct facerecog: View {
    @State private var isUnlocked = false
    
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    
    func authenticate(){
        let context = LAContext()
        var error: NSError?
        
        //check biometric possible or no
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            let reason = "we need to unlock your data"
            
            //try do bio check
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){
                success, authenticationError in
                
                if success{
                    isUnlocked = true
                }else{
                   
                }
            }
        }
        //if bio not available
        else{
            
        }
    }
}


#Preview {
    facerecog()
}
