//
//  Cardify.swift
//  Memorize
//
//  Created by Иван Дроботов on 10.12.2023.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    
    init(isFaceUp: Bool) {
        self.isFaceUp = isFaceUp
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            base
                .strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0 )
            base.opacity(isFaceUp ? 0 : 1)
        }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
