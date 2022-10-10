//
//  MemoryGame.swift
//  Memorize
//
//  Created by Simon Zhang on 9/9/22.
//

import Foundation
//This is aModel
// A model should provide data structure, modifiers, getter and setters
struct MemoryGameModel<CardContent> {
    var cards: Array<Card>

    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenIndex: Int = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }

    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return -1 // TODO: bogus
    }

    init(numberOfPairsOfCards: Int, cardContentFactory :(Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2,content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }

    // nesting struct: MemoryGame.Card
    struct Card: Identifiable {
        let id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
