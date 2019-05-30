//
//  Card.swift
//  jogo-da-memoria
//
//  Created by Leonardo Braga on 29/05/19.
//  Copyright © 2019 CWI. All rights reserved.
//

import Foundation

struct Card {
    
    var identifier: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    var cardState: CardState {
        if isMatched {
            return .matched
        } else if isFaceUp {
            return .front
        } else {
            return .back
        }
    }
    
    init(identifier: Int){
        self.identifier = identifier
    }
}
