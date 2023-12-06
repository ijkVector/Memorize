//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Иван Дроботов on 01.12.2023.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static func createMemoryGame(withTheme theme: Theme) -> MemoryGame<String> {
        return MemoryGame(theme.numberOfPairsOfCards) { pairIndex in
            if theme.emojis.indices.contains(pairIndex) {
                return theme.emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    init(currentTheme: Theme) {
        self.currentTheme = currentTheme
        self.game = EmojiMemoryGame.createMemoryGame(withTheme: currentTheme)
    }
    
    @Published private var game: MemoryGame<String>
    @Published private(set) var currentTheme: Theme
    private let themes = [
        Theme(name: "Animals", emoijs: ["🦊", "🐿️", "🦔", "🐘", "🐄", "🦬", "🐝", "🦫", "🦑", "🐷", "🐓", "🦛","🐑"], numberOfPairs: 4, color: .orange),
        Theme(name: "Plants", emoijs: ["🌹", "💐", "🌸", "🌺", "🍀", "🌷", "🌻", "🌿", "🌴", "🌳", "🌵", "🪴", "🌾"], numberOfPairs: 4, color: .green),
        Theme(name: "Cars", emoijs: ["🏎️", "🚕", "🚙", "🚗", "🛺"], numberOfPairs: 4, color: .blue),
        Theme(name: "Public transport", emoijs: ["✈️", "🚅", "🚇", "🚃", "🛳️"], numberOfPairs: 4, color: .yellow),
        Theme(name: "Personal transport", emoijs: ["🚲", "🏍️", "🛴", "🚁", "⛵️"], numberOfPairs: 4, color: .purple),
        Theme(name: "Halloween", emoijs:  ["🎃", "👻", "💀", "🕷️", "😈", "☠️", "🕸️"], numberOfPairs: 4, color: .red),
    ]
     
    
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
