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
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var startStation : String
        var endStation : String
        
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

extension SubtWidgetAttributes {
    static var preview: SubtWidgetAttributes {
        SubtWidgetAttributes(name: "World")
    }
}

extension SubtWidgetAttributes.ContentState {
    static var smiley: SubtWidgetAttributes.ContentState {
        SubtWidgetAttributes.ContentState(startStation: "신림", endStation: "삼성", emoji: "🐳")
     }
     
     static var starEyes: SubtWidgetAttributes.ContentState {
         SubtWidgetAttributes.ContentState(startStation: "신림", endStation: "삼성", emoji: "🐳")
     }
}
