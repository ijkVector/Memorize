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
    
    //MARK: - UIBlocks
    var body: some View {
        VStack {
            Text(emojiGame.name)
                .font(.largeTitle)
            cards
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
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(count: emojiGame.cards.count,
                                                 size: geometry.size,
                                                 atAspectRatio: cardAspectRatio
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0) {
                ForEach(emojiGame.cards) { card in
                    CardView(card)
                        .aspectRatio(cardAspectRatio, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            emojiGame.choose(card)
                        }
                }
            }
        }
        .foregroundColor(emojiGame.color)
    }
    
    private func gridItemWidthThatFits(count: Int,
                               size: CGSize,
                               atAspectRatio aspectRatio: CGFloat
    ) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        repeat {
            let widthCard = size.width / columnCount
            let heightCard = widthCard / aspectRatio
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * heightCard < size.height {
                return (size.width / columnCount).rounded(.down)
            }
            columnCount += 1
        } while columnCount < count
        
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}

//MARK: - ViewModel
private struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0 ) //
            base.opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}




#Preview {
    EmojiMemoryGameView(emojiGame: 
                            EmojiMemoryGame(
                                currentTheme: Theme(name: "Animals", emoijs: ["🦊", "🐿️", "🦔", "🐘", "🐄", "🦬", "🐝", "🦫", "🦑", "🐷", "🐓", "🦛","🐑", "🐶", "🐖"], numberOfPairs: 15 , color: .orange)
                            )
    )
}
