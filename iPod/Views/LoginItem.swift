//
//  LoginItem.swift
//  iPod
//
//  Created by Tyler Cagle on 6/17/22.
//

import SwiftUI

struct LoginItem: View {
    let item: Item
    let selected: Bool
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                HStack {
                    Image("music")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .clipShape(RoundedRectangle(cornerRadius: .itemRounded, style: .continuous))
                    
                    Image("podcasts")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .clipShape(RoundedRectangle(cornerRadius: .itemRounded, style: .continuous))
                    
                    Image("tv")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .clipShape(RoundedRectangle(cornerRadius: .itemRounded, style: .continuous))
                }
                .padding(.bottom, 12.0)
                
                Text("Login with Apple")
                    .foregroundColor(.black)
                    .font(.title2)
                
                AppleButton()
            }
            .padding(.expandedItemPadding * 2)
            
            Spacer()
        }
        .background(selected ? Color.white.opacity(0.75) : Color.white.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: .itemRounded, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: .itemRounded, style: .continuous).stroke(selected ? Color.white.opacity(0.4) : .clear, lineWidth: 1))
        .padding(.horizontal, .itemMargin)
    }
}
