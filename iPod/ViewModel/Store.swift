//
//  ViewModel.swift
//  iPod
//
//  Created by Tyler Cagle on 6/17/22.
//

import SwiftUI
import CoreHaptics

typealias DataStore = Store<DataState>

@MainActor
class Store<DataState>: ObservableObject {
    private var engine: CHHapticEngine!
    
    @Published var playerState: PlayerState
    @Published var user: Bool = false
    
    @Published var menuState: MenuState
    @Published var menuIndexSelected: Int
    @Published var menuItems: [Item]
    
    init() {
        playerState = .home
        
        menuState = .open
        menuIndexSelected = 0
        menuItems = [ Item(state: .music, title: "Music", imageName: "music"), Item(state: .podcasts, title: "Podcasts", imageName: "podcasts"), Item(state: .tv, title: "TV", imageName: "tv"), Item(state: .youtube, title: "Youtube", imageName: "youtube"), Item(state: .settings, title: "Settings", imageName: "settings")]
        
        prepareHaptics()
    }
    
    private func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func createHapticEvent(intensity: Float, sharpness: Float) {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // create one intense, sharp tap
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
}
