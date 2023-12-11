//
//  MemoryGame.swift
//  Memorize
//
//  Created by Иван Дроботов on 01.12.2023.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card]
    private(set) var score: Int = 0
    
    init(_ numberOfPairsOfCards: Int, cardContenFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContenFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOfTheOnlyAndOnlyFaceUPCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOnlyAndOnlyFaceUPCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score += 2
                    } else {
                        score += cards[chosenIndex].isBeenSeen ? -1 : 0
                        score += cards[potentialMatchIndex].isBeenSeen ? -1 : 0
                        cards[chosenIndex].isBeenSeen = true
                        cards[potentialMatchIndex].isBeenSeen = true
                    }
                } else {
                    indexOfTheOnlyAndOnlyFaceUPCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        var isFaceUp = true
        var isMatched = false
        var isBeenSeen = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down")\(isMatched ? "matched" : "")"
        }
    }
}


extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
