//
//  ContentView.swift
//  iPod
//
//  Created by Tyler Cagle on 6/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        ZStack {
            VStack(spacing: .bezel) {
                // Screen
                ScreenView()
                
                // Controls
                ControlsView()
            }
            
//            Rectangle()
//                .frame(width: 10, height: 10)
//                .foregroundColor(.red)
//                .position(x: UIScreen.screenWidth / 2, y: UIScreen.screenHeight - 150.0)
//        }
        .padding(.bottom, .bezel)
        .background(
            LinearGradient(gradient: Gradient(colors: [.bezelLight, .bezelDark]), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.top)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
