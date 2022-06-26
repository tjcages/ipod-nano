//
//  MenuItem.swift
//  iPod
//
//  Created by Tyler Cagle on 6/17/22.
//

import SwiftUI

struct MenuItem: View {
    let item: Item
    let selected: Bool
    let expanded: Bool
    
    var body: some View {
        HStack {
            Image(item.imageName)
                .resizable()
                .frame(width: 32, height: 32)
                .clipShape(RoundedRectangle(cornerRadius: .itemRounded, style: .continuous))
            
            Text(item.title)
                .foregroundColor(.black)
                .font(.title3)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .padding(.itemPadding)
        .background(selected ? Color.white.opacity(0.75) : Color.white.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: .itemRounded, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: .itemRounded, style: .continuous).stroke(selected ? Color.white.opacity(0.4) : .clear, lineWidth: 1))
        .padding(.horizontal, .itemMargin)
    }
}
