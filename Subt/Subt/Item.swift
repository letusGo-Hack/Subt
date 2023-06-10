//
//  Item.swift
//  Subt
//
//  Created by Kyeongmo Yang on 2023/06/10.
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
