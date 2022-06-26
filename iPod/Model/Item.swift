//
//  Itme.swift
//  iPod
//
//  Created by Tyler Cagle on 6/17/22.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let state: PlayerState
    let title: String
    let imageName: String
}
