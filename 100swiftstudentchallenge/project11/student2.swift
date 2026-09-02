//
//  student2.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 02/09/26.
//

import Foundation
import SwiftData


@Model
class Student2{
    var id = UUID()
    var name: String
    
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
