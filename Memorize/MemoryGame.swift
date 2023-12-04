//
//  MemoryGame.swift
//  Memorize
//
//  Created by Иван Дроботов on 01.12.2023.
//

import Foundation

struct MemoryGame<CardContent>  {
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContenFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContenFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    
    
    func choose(_ card: Card)  {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
