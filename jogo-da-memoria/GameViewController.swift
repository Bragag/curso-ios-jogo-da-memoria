//
//  ViewController.swift
//  jogo-da-memoria
//
//  Created by Leonardo Braga on 25/05/19.
//  Copyright © 2019 CWI. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    lazy var game = Game(numberOfPairOfCards: buttonsArray.count / 2)
    
    private let congratulationsSegue = "show-congratulations"
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        activityIndicator.isHidden = true
    }
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var buttonsArray: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel! {
        didSet {
            flipCountLabel.textColor = .white
        }
    }
    
    var cardTextProvider: CardTextProvider!
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if let cardNumber: Int = buttonsArray.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            self.updateViewFromModel()
            flipCount += 1
        }
    }
    
    func updateViewFromModel() {
        let cardsLength = game.cards.count
        let matchedCardsLength = game.matchedCards.count
        
        if cardsLength == matchedCardsLength {
            activityIndicator.isHidden = false
            flipCountLabel.textColor = .clear
            DispatchQueue.main.asyncAfter(deadline:.now() + 1.0, execute: {
                 self.performSegue(withIdentifier: self.congratulationsSegue, sender: nil)
            })
        }
        
        for index in game.cards.indices {
            let button = self.buttonsArray[index]
            let card = self.game.cards[index]
            //            let emptyTitle: () -> Void =  { button.setTitle("", for: .normal) }
            //            let emptyTitle = button.setTitle("", for: .normal)
            
            switch card.cardState {
            case .back:
                button.backgroundColor = #colorLiteral(red: 1, green: 0.09094661612, blue: 0.5108055618, alpha: 1)
                button.setTitle("", for: .normal)
            case .front:
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(cardTextProvider.text(for: card.identifier), for: .normal)
            case .matched:
                button.backgroundColor =  .clear
                button.setTitle("", for: .normal)
            }
        }
    }
}

