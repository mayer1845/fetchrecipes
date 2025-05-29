//
//  Item.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/29/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
