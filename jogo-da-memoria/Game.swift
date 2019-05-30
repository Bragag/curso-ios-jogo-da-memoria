//
//  Game.swift
//  jogo-da-memoria
//
//  Created by Leonardo Braga on 25/05/19.
//  Copyright © 2019 CWI. All rights reserved.
//

import Foundation

class Game {
    var cards: [Card] = [Card]()
    var matchedCards: [Card] = [Card]()
    var indexOfSelectedCard: Int?
    
    func chooseCard(at index: Int) {
        if cards.indices.contains(index),
            !cards[index].isMatched {
            
            // index != matchedIndex para verificar se o usuário não clicou na mesma carta
            if let matchedIndex = self.indexOfSelectedCard,
                index != matchedIndex {
                
                // Quando as duas cartas selecionadas são iguais
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                    self.matchedCards += [cards[index], cards[matchedIndex]]
                }
                
                cards[index].isFaceUp = true
                self.indexOfSelectedCard = nil
            } else {
                // Ao clicar na primeira carta do par
                for flipDownIndex in cards.indices {
                    // Manter as cartas viradas para baixo
                    cards[flipDownIndex].isFaceUp = cards[flipDownIndex].isMatched
                }
                
                cards[index].isFaceUp = true
                self.indexOfSelectedCard = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        for index in 0..<numberOfPairOfCards {
            let card = Card(identifier: index)
            
            self.cards += [card, card]
            self.cards.shuffle()
        }
        
    }
}

enum CardState {
    case back, front, matched
}
