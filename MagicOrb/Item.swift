//
//  Item.swift
//  MagicOrb
//
//  Created by Simon Erlic on 2023-07-15.
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
