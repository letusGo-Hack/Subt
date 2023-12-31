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
            LockScreenView(context: context, progress: Double(1 - context.state.remain / context.state.total))
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                
                DynamicIslandExpandedRegion(.center) {
                    HStack(spacing : 30) {
                        Text(context.state.startStation)
                        
                        RoundedRectangle(cornerRadius: 1)
                            .fill(.white)
                            .frame(height: 2)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .overlay(alignment: .trailing) {
                                Image(systemName: "arrow.forward")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.white)
                            }
                        Text(context.state.endStation)
                    }
                }
                
                DynamicIslandExpandedRegion(.leading) {
                    Text(context.state.startStation)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.endStation)
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    Text("\(context.state.endStation)방향으로 이동중입니다.")
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

//#Preview("Notification", as: .content, using: SubtWidgetAttributes.preview) {
//    SubtWidgetLiveActivity()
//} contentStates: {
//    SubtWidgetAttributes.ContentState.start
//    SubtWidgetAttributes.ContentState.half
//}
