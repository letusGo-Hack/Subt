//
//  SubtWidgetEntryView.swift
//  SubtWidgetExtension
//
//  Created by 박현우 on 2023/06/10.
//

import WidgetKit
import SwiftUI

struct SubtWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            Text(entry.date, style: .time)
            
            HStack {
                Text(entry.configuration.startStation)
                progressView(entry: entry)
                Text(entry.configuration.endStation)
            }
            
        }
        // entry 안에 있는 값을 통해 Gradient 해줘야함
        .containerBackground(.blue, for: .widget)
    }
    
    private func progressView(entry : Provider.Entry) -> some View {
        VStack {
            ProgressView(value: entry.configuration.progress, total: 1)
                .tint(.red)
            Text("🚂")
        }
    }
    
    struct BottomLineView: View {
        var time: Date
        
        var body: some View {
            HStack {
                Divider().frame(width: 50,
                                height: 10)
                .overlay(.gray).cornerRadius(5)
                Image("delivery")
                VStack {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(style: StrokeStyle(lineWidth: 1,
                                                   dash: [4]))
                        .frame(height: 10)
                        .overlay(Text(time, style: .timer).font(.system(size: 8)).multilineTextAlignment(.center))
                }
                Image("home-address")
            }
        }
    }
}

#Preview(as: WidgetFamily.systemMedium) {
    SubtWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .sillimToNak)
    SimpleEntry(date: .now + 3, configuration: .nakToSeocho)
    SimpleEntry(date: .now + 6, configuration: .seochoToGangnam)
}
