//
//  CardViewController.swift
//  DeckOfCards
//
//  Created by Eric Andersen on 9/3/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: .green, bottomColor: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
    }
    
    
    func updateViews() {
        
        CardController.shared.fetchCard(count: 1) { (cards) in
            guard let card = cards?.first else { return }
            // We want the first card that came back
            DispatchQueue.main.async {
                self.suitLabel.text = card.suit
                self.valueLabel.text = card.value
            }
            
            CardController.shared.fetchCardImage(card: card, completion: { (image) in
                DispatchQueue.main.async {
                    self.cardImageView.image = image
                }
            })
        }
    }
    
    
    @IBAction func drawButtonTapped(_ sender: UIButton) {
        updateViews()
    }
}

