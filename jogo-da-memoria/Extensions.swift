//
//  Extensions.swift
//  jogo-da-memoria
//
//  Created by Leonardo Braga on 25/05/19.
//  Copyright © 2019 CWI. All rights reserved.
//

import Foundation

extension Bool {
    mutating func toggle () {
        self = !self
    }
}

extension Array {
     mutating func removeRandomElement() -> Element {
       return self.remove(at: Int.random(in: self.indices))
    }
}
