//
//  EditUserView.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 03/09/26.
//

import SwiftUI
import SwiftData


struct EditUserView: View {
    @Bindable var user: User3

    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            TextField("City", text: $user.city)
            DatePicker("Join Date", selection: $user.joinDate)
        }
        .navigationTitle("Edit User")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true )
        let container = try ModelContainer(for: User3.self, configurations: config)
        let user = User3(name: "Taylor Swift", city: "Nashville", joinDate: .now)
        return EditUserView(user: user)
            .modelContainer(container)

    }catch {
        return Text(error.localizedDescription)
    }
}
