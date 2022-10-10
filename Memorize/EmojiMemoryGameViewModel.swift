//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Simon Zhang on 9/9/22.
//

import SwiftUI
// ViewModel never talks to their view. View talks to the view models instead

class EmojiMemoryGameViewModel: ObservableObject {
    //MARK: -Intent(s)
    //var model : MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2) {_ in "😄"}
    @Published private var model = EmojiMemoryGameViewModel.createMemoryGame()

    static func createMemoryGame() -> MemoryGameModel<String> {
        let emojis: Array<String> = ["👻","🎃","🕷"]
        return MemoryGameModel<String>(numberOfPairsOfCards: emojis.count){ index in emojis[index]}
    }

    var cards: Array<MemoryGameModel<String>.Card> {model.cards}
    func choose(card: MemoryGameModel<String>.Card){
        model.choose(card: card)
    }

}
