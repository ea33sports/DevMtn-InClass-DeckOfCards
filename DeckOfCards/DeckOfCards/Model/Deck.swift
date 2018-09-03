//
//  Deck.swift
//  DeckOfCards
//
//  Created by Eric Andersen on 9/3/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import Foundation

struct DeckDictionary: Decodable {

    // This property is on the top level of the JSON
    // MARK: - Properties
    let cards: [Card]
    
    // We don't have to use this because 'cards' matches the JSON
    //private enum CodingKeys: String, CodingKey {
    //    case cards = "cards"
    //}
}

struct Card: Decodable {
    
    let value: String
    let suit: String
    let image: String
}
