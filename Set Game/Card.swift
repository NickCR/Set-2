//
//  Card.swift
//  Set Game
//
//  Created by Jelly Slather on 2/16/18.
//  Copyright © 2018 Rudinski. All rights reserved.
//

import Foundation

enum ShapeType: String {
    case Triangle = "\u{25B2}"
    case TwoTriangle = "\u{25B2}\u{25B2}"
    case ThreeTriangle = "\u{25B2}\u{25B2}\u{25B2}"
    case Circle = "\u{25CF}"
    case TwoCircle = "\u{25CF}\u{25CF}"
    case ThreeCircle = "\u{25CF}\u{25CF}\u{25CF}"
    case Square = "\u{25A0}"
    case TwoSquare = "\u{25A0}\u{25A0}"
    case ThreeSquare = "\u{25A0}\u{25A0}\u{25A0}"
}
//count shape with variables as well

enum ShapeColor: String {
    case Red = "Red"
    case Green = "Green"
    case Purple = "Purple"
}

enum ShapeShade: String {
    case Filled = "Filled"
    case Striped = "Striped"
    case Empty = "Empty"
}
    
struct Card {
    
    //let cardBackground = "white"
    let cardShape : ShapeType
    let cardColor : ShapeColor
    let cardShade : ShapeShade
    
    func attributedString() -> NSAttributedString! {
        return NSAttributedString()
    }
}



func createDeck() -> [Card] {
    let cardShape = [ShapeType.Triangle, ShapeType.TwoTriangle, ShapeType.ThreeTriangle, ShapeType.Circle, ShapeType.TwoCircle, ShapeType.ThreeCircle, ShapeType.Square, ShapeType.TwoSquare, ShapeType.ThreeSquare]
    let cardColor = [ShapeColor.Red, ShapeColor.Green, ShapeColor.Purple]
    let cardShade = [ShapeShade.Filled, ShapeShade.Striped, ShapeShade.Empty]
    var deck = [Card]()
    for cardShape in cardShape {
        for cardColor in cardColor {
            for cardShade in cardShade {
                deck.append(Card(cardShape: cardShape, cardColor: cardColor, cardShade: cardShade))
            }
        }
    }
    return deck
}


