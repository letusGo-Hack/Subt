//
//  SubtWidgetLiveActivity.swift
//  SubtWidget
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SubtWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SubtWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            LockScreenView(context: context)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                
                DynamicIslandExpandedRegion(.center) {
                    ProgressView(value: 1)
                }
                
                DynamicIslandExpandedRegion(.leading) {
                    Text(context.state.startStation)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.endStation)
                }
                                
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    Text("Bottom \(context.state.emoji)")
                    Text("Bottom \(context.state.emoji)")

                    
                    // more content
                }
            } compactLeading: {
                CompactLeadingView(context: context)
            } compactTrailing: {
                CompactTrailingView(context: context)
            } minimal: {
                MinimalView(context: context)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

#Preview("Notification", as: .content, using: SubtWidgetAttributes.preview) {
   SubtWidgetLiveActivity()
} contentStates: {
    SubtWidgetAttributes.ContentState.smiley
    SubtWidgetAttributes.ContentState.starEyes
}
