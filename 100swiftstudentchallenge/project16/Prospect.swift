//
//  Prospect.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 11/09/26.
//

import SwiftData

@Model
class Prospect{
    var name: String
    var emailAddress: String
    var isContacted: Bool
    
    
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
    }
}
