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
        HStack(spacing : 10) {
            Text(entry.configuration.startStation)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            progressView(entry: entry)
            
            Text(entry.configuration.endStation)
                .fontWeight(.bold)
                .foregroundStyle(.white)

        }
        // entry 안에 있는 값을 통해 Gradient 해줘야함
        .containerBackground(LinearGradient(gradient: Gradient(stops: [
            Gradient.Stop(color: .line2, location: 0),
            Gradient.Stop(color: .line1, location: 1)
        ]), startPoint: .leading, endPoint: .trailing), for: .widget)
    }
    
    private func progressView(entry : Provider.Entry) -> some View {
        VStack(alignment: .center) {
            Spacer(minLength: 70)
            GeometryReader { geometry in
                Image(systemName: "train.side.front.car")
                    .foregroundStyle(.white)
                    .offset(x: geometry.size.width * CGFloat(entry.configuration.progress) - 26 , y: -20)
                
                ProgressView(value: entry.configuration.progress, total: 1)
                    .tint(.white)
            }
        }
    }
}

//#Preview(as: WidgetFamily.systemMedium) {
//    SubtWidget()
//} timeline: {
//    SimpleEntry(date: .now, configuration: .sillimToNak)
//    SimpleEntry(date: .now + 3, configuration: .nakToSeocho)
//    SimpleEntry(date: .now + 6, configuration: .seochoToGangnam)
//}
