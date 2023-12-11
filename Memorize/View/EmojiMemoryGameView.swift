//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Иван Дроботов on 28.11.2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var emojiGame: EmojiMemoryGame
    
    private let cardAspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    //MARK: - UIBlocks
    var body: some View {
        VStack {
            Text(emojiGame.name)
                .font(.largeTitle)
            cards
                .foregroundColor(emojiGame.color)
                .animation(.default, value: emojiGame.cards)
            Text("Score: \(emojiGame.score)")
                .font(.title2)
            Button("New Game") {
                emojiGame.newGame()
            }
            .font(.title)
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(emojiGame.cards, aspectRatio: cardAspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .onTapGesture {
                    emojiGame.choose(card)
                }
        }
    }
}




#Preview {
    EmojiMemoryGameView(emojiGame: 
                            EmojiMemoryGame(
                                currentTheme: Theme(name: "Animals", emoijs: ["🦊", "🐿️", "🦔", "🐘", "🐄", "🦬", "🐝", "🦫", "🦑", "🐷", "🐓", "🦛","🐑", "🐶", "🐖"], numberOfPairs: 2 , color: .orange)
                            )
    )
}
