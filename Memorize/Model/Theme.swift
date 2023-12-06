//
//  Theme.swift
//  Memorize
//
//  Created by Иван Дроботов on 05.12.2023.
//

import Foundation

struct Theme: CustomDebugStringConvertible {
    let name: String
    private(set) var emojis: [String]
    let numberOfPairsOfCards: Int
    private(set) var color: UIIndependentColor
    
    init(name: String, emoijs: [String], numberOfPairs: Int, color: UIIndependentColor) {
        self.name = name
        self.emojis = emoijs
        self.numberOfPairsOfCards = numberOfPairs
        self.color = color
    }
    
    var debugDescription: String {
        "\(name): \(emojis)"
    }
    
    mutating func shuffle() {
        emojis.shuffle()
    }
}

enum UIIndependentColor: String {
    case orange
    case red
    case blue
    case green
    case yellow
    case purple
}
