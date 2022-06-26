//
//  Screen.swift
//  iPod
//
//  Created by Tyler Cagle on 6/17/22.
//

import SwiftUI

struct ScreenView: View {
    @EnvironmentObject var store: DataStore
    
    let maxHeight: CGFloat = 464
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Content
            HStack(alignment: .center) {
                Image("mac")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: maxHeight)
                    .offset(x: store.menuState == .open ? UIScreen.screenWidth * 0.25 : store.menuState == .expanded ? 0.5 : 0)
            }
            .background(.blue)
            .overlay(Rectangle().foregroundColor(store.menuState == .open ? Color.bezelLight.opacity(0.4) : .clear))
            
            ScrollView {
                ScrollViewReader { value in
                    ForEach(0 ..< store.menuItems.count, id: \.self) { i in
                        let item = store.menuItems[i]
                        let selected = i == store.menuIndexSelected
                        let expanded = store.playerState == item.state
                        
                        if !store.user && item.state == .login {
                            LoginItem(item: item, selected: selected)
                        } else {
                            MenuItem(item: item, selected: selected, expanded: expanded)
                        }
                    }
                    .onReceive(store.$menuIndexSelected) { output in
                        var previousIndex = store.menuIndexSelected - 1
                        if previousIndex < 0 || store.menuIndexSelected >= store.menuItems.count
                        { previousIndex = 0 }
                        value.scrollTo(previousIndex, anchor: .top)
                    }
                    
                    Spacer()
                }
            }
            .padding(.top, .navigation)
            .frame(maxWidth: store.menuState == .open ? UIScreen.screenWidth * 0.55 : store.menuState == .expanded ? UIScreen.screenWidth : 0)
            .background(
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .blur(radius: 1)
                    .overlay(Rectangle().foregroundColor(Color.bezelLight.opacity(0.2)))
            )
            .border(width: 1, edges: [.trailing], color: Color.white.opacity(0.2))
            .clipped()
            .shadow(color: Color.bezelLight.opacity(.shadowOpacity), radius: .shadowRadius, x: .shadowWidth, y: .shadowHeight)
            .disabled(true)
        }
        .frame(maxHeight: maxHeight)
        .background(.white)
        .cornerRadius(.screenRounded, corners: [.bottomLeft, .bottomRight])
        .overlay(RoundedRectangle(cornerRadius: .screenRounded, style: .continuous).stroke(Color.black, lineWidth: 4))
    }
}
