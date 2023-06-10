//
//  ViewModel.swift
//  Subt
//
//  Created by 박현우 on 2023/06/10.
//

import Foundation
import ActivityKit

class ViewModel: ObservableObject {
    @Published public var activity: Activity<SubtWidgetAttributes>?
    @Published public var remain: Int = 10
    @Published public var start: String = ""
    @Published public var end: String = ""
    
    func createLiveAcitiviy(start: String, end: String, complietion: @escaping (() -> Void)) {
        self.start = start
        self.end = end
        
        let attributes = SubtWidgetAttributes(name: "test")
        let contentState = SubtWidgetAttributes.ContentState(
            startStation: start,
            endStation: end,
            state: .departure,
            total: remain,
            remain: remain
        )
        do {
            let activityContent = ActivityContent(state: contentState, staleDate: nil)
            activity = try Activity.request(attributes: attributes, content: activityContent)
            complietion()
        } catch (let error) {
            print("Error requesting stock trade Live Activity \(error.localizedDescription).")
        }
    }
    
        func updateLiveActivity() async {
        guard activity?.activityState == .active else { return }
        let contentState = SubtWidgetAttributes.ContentState(
            startStation: start,
            endStation: end,
            state: .moving,
            total: remain,
            remain: remain
        )
        let activityContent = ActivityContent(state: contentState, staleDate: nil)
        await activity?.update(activityContent)
    }
    
    func endLiveActivity() async {
        let contentState = SubtWidgetAttributes.ContentState(
            startStation: start,
            endStation: end,
            state: .moving,
            total: remain,
            remain: remain
        )
        let activityContent = ActivityContent(state: contentState, staleDate: nil)
        await activity?.end(activityContent, dismissalPolicy: .immediate)
    }
}
