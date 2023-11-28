//
//  ContentView.swift
//  Memorize
//
//  Created by Иван Дроботов on 28.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView(isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    var isFaceUp: Bool
    
    init() {
        self.isFaceUp = false
    }
    
    init(isFaceUp: Bool) {
        self.isFaceUp = isFaceUp
    }
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("✈️")
                    .font(.largeTitle)
                
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}




#Preview {
    ContentView()
}
