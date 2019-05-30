//
//  CardTextProvider.swift
//  jogo-da-memoria
//
//  Created by Leonardo Braga on 29/05/19.
//  Copyright © 2019 CWI. All rights reserved.
//

import Foundation

protocol CardTextProvider: AnyObject {
    
    func text(for identifier: Int) -> String
    var emojis: [Int: String] { get set }
    var emojisOptions: [String] { get set }
    
}

extension CardTextProvider {
    func text(for identifier: Int) -> String {
        if let emoji = self.emojis[identifier] {
            return emoji
        }
        
        let emoji = emojisOptions.removeRandomElement()
        self.emojis[identifier] = emoji
        
        return emoji
    }
}

class RandomThingsEmojiProvider: CardTextProvider{
    
    var emojis =  [Int: String]()
    var emojisOptions = ["🤠", "🧐", "🦚", "🧖🏻‍♂️"]
    
}

class AnimalsEmojiProvider: CardTextProvider{
    
    var emojis =  [Int: String]()
    var emojisOptions = ["🦊", "🦒", "🐨", "🦔"]
    
}
