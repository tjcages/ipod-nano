//
//  State.swift
//  iPod
//
//  Created by Tyler Cagle on 6/17/22.
//

import SwiftUI

class DataState: ObservableObject {
    // overall screen in game
    @Published var menuState: MenuState = .open
    @Published var state: PlayerState = .home
}

enum PlayerState {
    case home
    case music
    case podcasts
    case tv
    case youtube
    case settings
    case login
}

enum MenuState {
    case open
    case closed
    case expanded
}
