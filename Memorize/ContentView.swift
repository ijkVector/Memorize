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
            title
            ScrollView {
                cards
            }
            buttons
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
    
    var buttons: some View {
        HStack(alignment: .center) {
            Spacer()
            vehiclesTheme
            Spacer()
            clothTheme
            Spacer()
            animalsTheme
            Spacer()
        }
        .font(.largeTitle)
    }
    
    //MARK: - UIConfiguration
    func themeConfiguration(themeEmojis: [String], text: String, symbol: String, color withColor: Color) -> some View {
        Button(action: {
            cardCount = Int.random(in: 2..<9)
            emojis = themeEmojis[0..<cardCount].shuffled() + themeEmojis[0..<cardCount].shuffled()
            color = withColor
        }, label: {
            VStack {
                Image(systemName: symbol)
                Text(text).font(.footnote)
            }
        })
    }
    
    //MARK: - UIElementaryElements
    var vehiclesTheme: some View {
        themeConfiguration(themeEmojis: vehicles ,text: "Vehicles",symbol: "car", color: .red)
    }
    
    var clothTheme: some View {
        themeConfiguration(themeEmojis: cloth, text: "Cloth", symbol: "hanger", color: .orange)
    }
    
    var animalsTheme: some View {
        themeConfiguration(themeEmojis: animals, text: "Animals",symbol: "hare", color: .green)
    }
    
    var title: some View {
        Text("Memorize!")
            .imageScale(.large)
            .font(.largeTitle)
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
