//
//  Card.swift
//  Set Game
//
//  Created by Jelly Slather on 2/16/18.
//  Copyright © 2018 Rudinski. All rights reserved.
//

import Foundation
import UIKit

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
    
    let cardShape : ShapeType
    let cardColor : ShapeColor
    let cardShade : ShapeShade
    
    func attributedString(_  : String) -> NSAttributedString! {
        var attributes: [NSAttributedStringKey: Any] = [
            //make stroke width positive and negative for filled in and empty and withAlphaComponent(0.15) for striped in the uiColor func? Feels wrong to split them.
            .foregroundColor : uiColor(cardColor.rawValue, cardShade.rawValue),
        ]
            if cardShade.rawValue == "Empty" {
                attributes[.strokeWidth] = 3
            }
        return NSAttributedString(string: cardShape.rawValue, attributes: attributes)
    }
    
    func uiColor(_ shapeColorSetter : String, _ shapeShadeSetter : String) -> UIColor! {
        
        var colorOfString : UIColor
        
        switch shapeColorSetter {
            case "Red" : colorOfString = UIColor.red
            case "Green" : colorOfString = UIColor.green
            case "Purple" : colorOfString = UIColor.purple
            default : colorOfString = UIColor.black
        }
        
        switch shapeShadeSetter{
            case "Filled" : colorOfString = colorOfString.withAlphaComponent(1.0)
            case "Striped" : colorOfString = colorOfString.withAlphaComponent(0.15)
            case "Empty" : colorOfString = colorOfString.withAlphaComponent(1.0)
            //okay to not have empty in here? misleading to others?
            default : colorOfString = colorOfString.withAlphaComponent(0.0)
        }
        
        return colorOfString
    }
}

func createDeck() -> [Card] {
    let cardShape = [ShapeType.Triangle, ShapeType.TwoTriangle, ShapeType.ThreeTriangle, ShapeType.Circle, ShapeType.TwoCircle, ShapeType.ThreeCircle, ShapeType.Square, ShapeType.TwoSquare, ShapeType.ThreeSquare]
    let cardColor = [ShapeColor.Red, ShapeColor.Green, ShapeColor.Purple]
    let cardShade = [ShapeShade.Filled, ShapeShade.Striped, ShapeShade.Empty]
    var deck = [Card]()
    for cardShape in cardShape {
        //for i in 1...3 {
            for cardColor in cardColor {
                for cardShade in cardShade {
                    deck.append(Card(cardShape: cardShape, cardColor: cardColor, cardShade: cardShade))
                }
            }
        //}
    }
    return deck
}


