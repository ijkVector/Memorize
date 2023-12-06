//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Иван Дроботов on 28.11.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame(currentTheme: Theme(name: "Animals", emoijs: ["🦊", "🐿️", "🦔", "🐘", "🐄", "🦬", "🐝", "🦫", "🦑", "🐷", "🐓", "🦛","🐑"], numberOfPairs: 4, color: .orange))
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(emojiGame: game)
        }
    }
}
