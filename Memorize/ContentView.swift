//
//  ContentView.swift
//  Memorize
//
//  Created by Иван Дроботов on 28.11.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🎃", "👻", "💀", "🕷️", "😈"]
    
    var body: some View {
        HStack {
            ForEach(emojis, id: \.self) { emoji in
                CardView(content: emoji)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    init(content: String, isFaceUp: Bool = false) {
        self.content = content
        self.isFaceUp = isFaceUp
    }

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
                
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




#Preview {
    ContentView()
}
