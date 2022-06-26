//
//  Button.swift
//  iPod
//
//  Created by Tyler Cagle on 6/17/22.
//

import SwiftUI

struct AppleButton: View {
    
    var body: some View {
        HStack {
            Image(systemName: "applelogo")
            
            Text("Sign in with Apple")
                .font(.title3)
                .foregroundColor(.white)
        }
        .padding(.vertical, 6.0)
        .padding(.horizontal, 24.0)
        .contentShape(Rectangle())
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: .buttonRadius, style: .continuous))
    }
}
