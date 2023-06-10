//
//  Provider.swift
//  SubtWidgetExtension
//
//  Created by 박현우 on 2023/06/10.
//

import Foundation
import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct Provider: AppIntentTimelineProvider {
    
    let startStation: String
    let endStation: String
    let stationToGo: Int
    
    init(startStation: String, endStation: String, stationToGo: Int) {
        self.startStation = startStation
        self.endStation = endStation
        self.stationToGo = stationToGo
    }
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        let initialEntry = ConfigurationAppIntent()
        initialEntry.startStation = startStation
        initialEntry.progress = 0
        initialEntry.endStation = endStation
        
        var entries: [SimpleEntry] = [SimpleEntry(date: .now, configuration: initialEntry)]
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        // 남은역 받아오기
        
        var date = Date()
        
        for currentStation in 1...stationToGo {
            let intent = ConfigurationAppIntent()
            intent.progress = Double(currentStation) / Double(stationToGo)
            intent.startStation = startStation
            intent.endStation = endStation
            print(intent.progress)
            let entry = SimpleEntry(date: date, configuration: intent)
            entries.append(entry)
            
            date += 5
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    
    
    // 여기서 네트워크 호출
}


