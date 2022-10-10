// 3
//  MemorizeApp.swift
//  Memorize
//
//  Created by Simon Zhang on 9/8/22.
//

import SwiftUI
// Main
@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
        }
    }
}
