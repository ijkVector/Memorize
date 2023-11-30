//
//  ContentView.swift
//  Memorize
//
//  Created by Иван Дроботов on 28.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = []
    @State var cardCount = 0
    @State var color: Color = .orange
    
    let vehicles = ["✈️", "🚜", "🚂", "🚑", "🚁", "🚀", "🏍", "🚤", "🛴", "🛺", "🛩️"]
    let cloth = ["👖", "👗", "🧦", "🧢", "🥋", "🩳", "👘", "🧣"]
    let animals = ["🦊", "🐿️", "🦔", "🐘", "🐄", "🦬", "🐝", "🦫", "🦑"]
    
    //MARK: - UIBlocks
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    init(content: String, isFaceUp: Bool = false) {
        self.content = content
        self.isFaceUp = isFaceUp
    }

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
                
            }
            .opacity(isFaceUp ? 1 : 0 )
            base.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




#Preview {
    ContentView()
}
