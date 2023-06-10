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
        ZStack {
            HStack(spacing : 10) {
                
                VStack {
                    Text(entry.configuration.startStation)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("2호선")
                        .foregroundStyle(.white)
                        .font(.caption)
                }
                
                
                progressView(entry: entry)
                
                VStack {
                    Text(entry.configuration.endStation)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("2호선")
                        .foregroundStyle(.white)
                        .font(.caption)
                }
                
            }
            
            if entry.configuration.progress == 1 {
                VStack {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                        .scaleEffect(2, anchor: .center)
                        .animation(.spring())
                        .onAppear {
                            pushEndNoti()
                        }
                        
                }
                
            }
        }
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
    
    private func pushEndNoti() {
        let content = UNMutableNotificationContent()
        content.title = "목적지에 거의 도착했어요!"
        content.body = "물건을 잘 챙기고, 늦지않게 내릴수 있도록 준비하세요."
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 28, repeats: false)
        let request = UNNotificationRequest(identifier: "NotificationIdentifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                // 노티피케이션 요청 추가 중에 에러가 발생했습니다.
                print("Error adding notification request: \(error.localizedDescription)")
            } else {
                // 노티피케이션 요청이 성공적으로 추가되었습니다.
                print("Notification request added successfully.")
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
