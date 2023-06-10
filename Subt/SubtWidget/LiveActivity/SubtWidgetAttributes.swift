//
//  SubtWidgetAttributes.swift
//  Subt
//
//  Created by 박현우 on 2023/06/10.
//

import Foundation
import WidgetKit
import ActivityKit
import SwiftUI

public struct SubtWidgetAttributes: ActivityAttributes {
    public enum OperationState : Int, Codable, Hashable {
        case departure
        case moving
        case arrived
    }
    
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var startStation : String
        var endStation : String
        var state : OperationState
        var total: Int
        var remain : Int
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

extension SubtWidgetAttributes {
    static var preview: SubtWidgetAttributes {
        SubtWidgetAttributes(name: "World")
    }
}
//
//extension SubtWidgetAttributes.ContentState {
//    static var start: SubtWidgetAttributes.ContentState {
//        SubtWidgetAttributes.ContentState(startStation: "신림", endStation: "삼성", remainStation: 10)
//     }
//     
//     static var half: SubtWidgetAttributes.ContentState {
//         SubtWidgetAttributes.ContentState(startStation: "신림", endStation: "삼성", remainStation: 5)
//     }
//}
