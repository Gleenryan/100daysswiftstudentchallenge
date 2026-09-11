//
//  day81.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 11/09/26.
//

import SwiftUI
import UserNotifications
import SamplePackage


struct day81: View {
    var results: String {
        let possibleNumbers = 1...60
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
        List{
            Text("Taylor")
                .swipeActions{
                    Button("HI"){}
                }
                .swipeActions(edge: .leading){
                    Button("Leading"){}
                }
        }
        
        Button("Req notif"){
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ success, error in
                if success{
                    print("good")
                }else{
                    print("not good")
                }
                
            }
        }
        Button("set notif"){
            let content = UNMutableNotificationContent()
            content.title = "feed the dog"
            content.subtitle = "yum yum"
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
        }
    }
}



#Preview {
    day81()
}
