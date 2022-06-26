//
//  iPodApp.swift
//  iPod
//
//  Created by Tyler Cagle on 6/17/22.
//

import SwiftUI

@main
struct iPodApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStore())
        }
    }
}
