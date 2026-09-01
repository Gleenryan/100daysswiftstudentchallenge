//
//  Order.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 01/09/26.
//

import Foundation


@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var specialRequestEnabled = false{
        didSet {
            if specialRequestEnabled == false{
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
}
