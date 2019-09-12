//
//  Concentration.swift
//  Concetration
//
//  Created by Adrian on 09/09/2019.
//  Copyright © 2019 Adrian. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfOneAndOnlyFacedCard: Int?
    
    func chooseCard(at index: Int) {
        // if the card is not matched
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFacedCard, matchIndex != index {
                // MARK: chceck if cards matched successfully
                // now chceck if card that is already facedUP and card that you selected right now is the same...
                if cards[matchIndex].identifier == cards[index].identifier {
                    //TODO: thats the matched cards! lets perform some funciton to fade away buttons and increment score
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                }
                // either way you must flip all cards and then deattatch index of first card
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedCard = nil
            } else {
                // MARK: either no card OR two cards is facedUP
                for flipDownIndex in cards.indices {
                    // flip all the cards!
                    cards[flipDownIndex].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
             // this all is only the copies that is injected to an array. For simpler syntax providing, this is compound assigment operator
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
