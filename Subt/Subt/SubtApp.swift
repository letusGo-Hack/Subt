//
//  SubtApp.swift
//  Subt
//
//  Created by Kyeongmo Yang on 2023/06/10.
//

import SwiftUI
import SwiftData

@main
struct SubtApp: App {
    let center = UNUserNotificationCenter.current()
    
    init() {
        registerForNotification()
    }
    
    func registerForNotification() {
        UIApplication.shared.registerForRemoteNotifications()
        let center : UNUserNotificationCenter = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.sound , .alert , .badge ], completionHandler: { (granted, error) in
            if ((error != nil)) { UIApplication.shared.registerForRemoteNotifications() }
            else {
                
            }
        })
    }
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
