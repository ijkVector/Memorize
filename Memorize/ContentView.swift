//
//  ContentView.swift
//  Memorize
//
//  Created by Иван Дроботов on 28.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🦊", "🐿️", "🦔", "🐘", "🐄", "🦬", "🐝", "🦫", "🦑", "🐷", "🐓", "🦛","🐑"]
    
    //MARK: - UIBlocks
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 95), spacing: 0)], spacing: 0) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
            .aspectRatio(2/3, contentMode: .fit)
            .padding(4)
        }
        .foregroundColor(.orange)
    }
}

//MARK: - ViewModel
struct CardView: View {
    let content: String
    @State var isFaceUp = true

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                
            }
            .opacity(isFaceUp ? 1 : 0 )
            base.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




#Preview {
    ContentView()
}
