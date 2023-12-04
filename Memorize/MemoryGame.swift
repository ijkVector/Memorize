//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Иван Дроботов on 01.12.2023.
//

import Foundation

struct MemorizeGame<CardContent>  {
    var cards: [Card]
    
    func chose(card: Card)  {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
