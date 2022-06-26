//
//  File.swift
//  iPod
//
//  Created by Tyler Cagle on 6/17/22.
//

import SwiftUI

extension Store {
    public func updateMenuIndex(index: Int) {
        if index != menuIndexSelected {
            menuIndexSelected = index
            
            // wheel control haptic
            createHapticEvent(intensity: 0.6, sharpness: 0.7)
        }
    }
    
    public func wheelClicked() {
        switch playerState {
        case .home:
            withAnimation {
                playerState = menuItems[menuIndexSelected].state
                menuState = .expanded
            }
        default:
            print("else")
        }
    }
}
