//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Иван Дроботов on 01.12.2023.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🦊", "🐿️", "🦔", "🐘", "🐄", "🦬", "🐝", "🦫", "🦑", "🐷", "🐓", "🦛","🐑"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var game = createMemoryGame()
     
    
    var cards: [MemoryGame<String>.Card] {
        return game.cards
    }
    
    //MARK: - Intents
    
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
}
