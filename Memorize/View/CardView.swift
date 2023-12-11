//
//  CardView.swift
//  Memorize
//
//  Created by Иван Дроботов on 08.12.2023.
//

import SwiftUI


struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    private let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .radians(.pi))
            .opacity(Constants.Pie.opacity)
            .overlay (
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.4
            static let inset: CGFloat = 5
        }
    }
}

#Preview {
    //    typealias Card = CardView.Card
    VStack {
        HStack {
            CardView(MemoryGame<String>.Card(isFaceUp: true, content: "🎃", id: "test1"))
                .aspectRatio(4/3, contentMode: .fit)
            CardView(MemoryGame<String>.Card(content: "🎃", id: "test1"))
        }
        HStack {
            CardView(MemoryGame<String>.Card(isFaceUp: true, isMatched: true, content: "🎃", id: "test1"))
            CardView(MemoryGame<String>.Card(isMatched: true, content: "🎃", id: "test1"))
        }
    }
    .padding()
    .foregroundColor(.green)
}
