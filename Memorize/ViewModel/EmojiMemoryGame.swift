//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Иван Дроботов on 01.12.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    //MARK: - Initialization functions
    init(currentTheme: Theme) {
        self.currentTheme = currentTheme
        self.game = EmojiMemoryGame.createMemoryGame(withTheme: currentTheme)
    }
    
    private static func createMemoryGame(withTheme theme: Theme) -> MemoryGame<String> {
        return MemoryGame(theme.numberOfPairsOfCards) { pairIndex in
            if theme.emojis.indices.contains(pairIndex) {
                return theme.emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    //MARK: - Connection to Model
    @Published private var game: MemoryGame<String>
    private var currentTheme: Theme
    private let themes = [
        Theme(name: "Animals", emoijs: ["🦊", "🐿️", "🦔", "🐘", "🐄", "🦬", "🐝", "🦫", "🦑", "🐷", "🐓", "🦛","🐑"], numberOfPairs: 10, color: .orange),
        Theme(name: "Plants", emoijs: ["🌹", "💐", "🌸", "🌺", "🍀", "🌷", "🌻", "🌿", "🌴", "🌳", "🌵", "🪴", "🌾"], numberOfPairs: 4, color: .green),
        Theme(name: "Cars", emoijs: ["🏎️", "🚕", "🚙", "🚗", "🛺"], numberOfPairs: 4, color: .blue),
        Theme(name: "Public transport", emoijs: ["✈️", "🚅", "🚇", "🚃", "🛳️"], numberOfPairs: 4, color: .yellow),
        Theme(name: "Personal transport", emoijs: ["🚲", "🏍️", "🛴", "🚁", "⛵️"], numberOfPairs: 4, color: .purple),
        Theme(name: "Halloween", emoijs:  ["🎃", "👻", "💀", "🕷️", "😈", "☠️", "🕸️"], numberOfPairs: 4, color: .red),
    ]
    
    //MARK: - Conntection to View (Interpret)
    var cards: [Card] {
        return game.cards
    }
    
    var name: String {
        return currentTheme.name
    }
    
    var score: Int {
        return game.score
    }
    
    var color: Color {
        switch currentTheme.color {
        case .orange:
            return .orange
        case .red:
            return .red
        case .blue:
            return .blue
        case .green:
            return .green
        case .yellow:
            return .yellow
        case .purple:
            return .purple
        }
    }
    
    //MARK: - Intents
    func newGame() {
        if let theme = themes.randomElement() {
            currentTheme = theme
            currentTheme.shuffle()
            game = EmojiMemoryGame.createMemoryGame(withTheme: currentTheme)
            game.shuffle()
        }
    }
    
    func choose(_ card: Card) {
        game.choose(card)
    }
}
