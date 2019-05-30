//
//  CongratulationsViewController.swift
//  jogo-da-memoria
//
//  Created by Leonardo Braga on 29/05/19.
//  Copyright © 2019 CWI. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController {

    private let playAgainSegue = "show-begin"
    
    @IBAction func touchPlayAgain(_ sender: Any) {
        self.performSegue(withIdentifier: playAgainSegue, sender: nil)
    }
}
