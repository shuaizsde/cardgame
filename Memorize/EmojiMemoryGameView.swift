//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Simon Zhang on 9/8/22.
//

import SwiftUI
// View
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    var body: some View {
        Grid(items: viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let frontScaleFactor: CGFloat = 0.75

    var card: MemoryGameModel<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.buildBody(size: geometry.size)
        }
    }
    func buildBody(size: CGSize) -> some View {
        ZStack(content: {
        if card.isFaceUp{
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
            Text(card.content)
        }else{
            RoundedRectangle(cornerRadius: cornerRadius).fill()
        }
        })
        .font(Font.system(size: fontSize(for: size)))
    }

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * frontScaleFactor
    }

}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: MemoryGameModel())
            .previewInterfaceOrientation(.portrait)
    }
}

*/
