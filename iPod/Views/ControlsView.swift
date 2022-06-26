//
//  Controls.swift
//  iPod
//
//  Created by Tyler Cagle on 6/17/22.
//

import SwiftUI

struct ControlsView: View {
    @EnvironmentObject var store: DataStore
    
    let maxWeelSize: CGFloat = 280.0
    let innerWeelSize: CGFloat = 100.0
    
    @State private var lastLocation: CGPoint?
    
    var body: some View {
        VStack {
            ZStack {
                Group {
                    VStack {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .frame(width: 10, height: 16)
                        
                        Spacer()
                        
                        Image(systemName: "playpause")
                            .resizable()
                            .frame(width: 22, height: 14)
                    }
                    HStack {
                        Image(systemName: "backward")
                            .resizable()
                            .frame(width: 22, height: 14)
                        
                        Spacer()
                        
                        Image(systemName: "forward")
                            .resizable()
                            .frame(width: 22, height: 14)
                    }
                }
                .foregroundColor(.white)
                .padding(.wheelPadding)
                
                // Inner wheel
                Button {
                    store.wheelClicked()
                } label: {
                    Circle()
                        .frame(width: innerWeelSize, height: innerWeelSize)
                        .overlay(LinearGradient(gradient: Gradient(colors: [.bezelLight, .bezelLight]), startPoint: .top, endPoint: .bottom).clipShape(Circle()))
                        .overlay(Circle().stroke(Color.white.opacity(0.05), lineWidth: 0.5))
                }
                .buttonStyle(.plain)
            }
            .frame(maxWidth: maxWeelSize, maxHeight: maxWeelSize)
            .background(Color.wheel)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.bezelLight.opacity(0.5), lineWidth: 1))
            .gesture(DragGesture(minimumDistance: 20.0)
                .onChanged({ value in
                    change(location: value.location)
                })
                    .onEnded({ value in
                        lastLocation = nil
                    })
            )
        }
        .frame(height: 300.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func change(location: CGPoint) {
        if lastLocation == nil { lastLocation = location }
        
        let centerX = UIScreen.screenWidth / 2
        let centerY = UIScreen.screenHeight - 150.0

        // creating vector from last location point
        let lastVector = CGVector(dx: lastLocation!.x - centerX, dy: lastLocation!.y - centerY)
        let vector = CGVector(dx: location.x - centerX, dy: location.y - centerY)
        
        // get the cross product
        let cross = lastVector.dx * vector.dy - lastVector.dy * vector.dx;
        if (cross > 0) { print("Clockwise") }
        if (cross < 0) { print("Counter") }
        if (cross == 0)  { print("Nuthin") }
            
        print(cross)
        
//        // creating vector from location point
//        let vector = CGVector(dx: location.x, dy: location.y)
//
//        // geting angle in radian need to subtract the knob radius and padding from the dy and dx
//        let angle = atan2(vector.dy - (innerWeelSize / 2 + 10), vector.dx - (innerWeelSize / 2 + 10)) + .pi/2.0
//
//        // convert angle range from (-pi to pi) to (0 to 2pi)
//        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
//        // convert angle value to temperature value
//        let value = fixedAngle / (2.0 * .pi) * CGFloat(store.menuItems.count)
//        let rounded = Int(value.rounded())
//
//        if rounded >= 0 && rounded <= store.menuItems.count {
//            store.updateMenuIndex(index: rounded)
//        }
        
        
        
        lastLocation = location
    }
}
