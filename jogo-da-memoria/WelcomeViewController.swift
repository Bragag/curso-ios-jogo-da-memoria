//
//  WelcomeViewController.swift
//  jogo-da-memoria
//
//  Created by Leonardo Braga on 29/05/19.
//  Copyright © 2019 CWI. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var cardTextProvider: CardTextProvider?
    private let gameSegue = "show-game"
    
    @IBAction func touchRandomThings(_ sender: Any) {
        self.cardTextProvider = RandomThingsEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
    }
    
    @IBAction func touchAnimalsThings(_ sender: Any) {
        self.cardTextProvider = AnimalsEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GameViewController {
            destination.cardTextProvider = self.cardTextProvider
        }
    }
}
