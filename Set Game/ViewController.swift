//
//  ViewController.swift
//  Set Game
//
//  Created by Jelly Slather on 2/16/18.
//  Copyright © 2018 Rudinski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons : [UIButton]!
    @IBOutlet weak var pointTotal: UILabel!
    var fullDeck = createDeck()
    var clickCount = 0
    var cardsInPlay = Array(repeating: Card(cardShape: ShapeType.Triangle, cardColor: ShapeColor.Red, cardShade: ShapeShade.Filled), count: 24)
    var pickedCards = Array(repeating: Card(cardShape: ShapeType.Triangle, cardColor: ShapeColor.Red, cardShade: ShapeShade.Filled), count: 3)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullDeck.shuffle()

        /*
        for i in 0...23 {
            let button = cardButtons[i]
            button.setTitle("empty", for: .normal)
        }
        */
        
        for i in 0...11 {
            drawCardAt(i)
        }

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func drawCardAt (_ i : Int) {
        let button = cardButtons[i]
        let card = fullDeck[0]
        cardsInPlay[i] = card
        button.backgroundColor = UIColor.white
        let attributedText = card.attributedString(card.cardColor.rawValue)
        button.setAttributedTitle(attributedText, for: .normal)
        fullDeck.remove(at: 0)
    }
    
    func resetCard (_ i : Int) {
        let button = cardButtons[i]
        button.setAttributedTitle(nil, for: UIControlState.normal)
        button.layer.borderWidth = 0.0
        button.layer.borderColor = UIColor.clear.cgColor
        button.backgroundColor = UIColor.black
    }
    
    func checkMatch (_ x : String, _ y : String, _ z : String) -> Bool {
        var isMatched = false
        
        if x == y, y == z, x == z {
            isMatched = true
            
            //don't even need .isMatched or to reference cardsInPlay. If these cards are a set then just remove everything flagged as blueborder. flag it as shapes matching?
        }
        
        if x != y, y != z, x != z {
            isMatched = true
        }
        return isMatched
    }
    
    
    private func updateViewFromModel() {
        //have to put the matched options here
        let shapeCheck = checkMatch(pickedCards[0].cardShape.rawValue, pickedCards[1].cardShape.rawValue, pickedCards[2].cardShape.rawValue)
        let colorCheck = checkMatch(pickedCards[0].cardColor.rawValue, pickedCards[1].cardColor.rawValue, pickedCards[2].cardColor.rawValue)
        let shadeCheck = checkMatch(pickedCards[0].cardShade.rawValue, pickedCards[1].cardShade.rawValue, pickedCards[2].cardShade.rawValue)
        
        if shapeCheck == true , colorCheck == true, shadeCheck == true {
            //print match?
            //pointTotal += 3
            for i in cardButtons.indices {
                let button = cardButtons[i]
                //let card = fullDeck[i]
                if button.layer.borderColor == UIColor.blue.cgColor {
                    resetCard(i)
                }
            }
        }
            else {
            //print no match?
            for i in cardButtons.indices {
                let button = cardButtons[i]
                //let card = fullDeck[i]
                button.layer.borderWidth = 3.0
                button.layer.borderColor = UIColor.clear.cgColor
                }
            }
            pickedCards = Array(repeating: Card(cardShape: ShapeType.Triangle, cardColor: ShapeColor.Red, cardShade: ShapeShade.Filled), count: 3)
        }
        
        /*
        switch (pickedCards[0].cardShape, pickedCards[1].cardShape, pickedCards[2].cardShape) {
        case (ShapeType.Triangle, ShapeType.Triangle, ShapeType.Triangle) : print("match")
        default:
            print("no match")
        }
 */
    
    @IBAction func newGame(_ sender: UIButton) {
        fullDeck = createDeck()
        fullDeck.shuffle()
        for i in 0...11 {
            drawCardAt(i)
        }
        for i in 12...23 {
            resetCard(i)
        }
    }

    @IBAction func ancestralVisions(_ sender: UIButton) {
        for _ in 1...3 {
            for i in 0..<cardButtons.count {
                let button = cardButtons[i]
                if button.backgroundColor == UIColor.black, i < 24 {
                    drawCardAt(i)
                    break
                }
            }
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if clickCount < 3, sender.layer.borderColor != UIColor.blue.cgColor {
            //pretty sure this will go to else and reset if you click wrong. It doesn't! But why not...
            sender.layer.borderWidth = 3.0
            sender.layer.borderColor = UIColor.blue.cgColor
            for i in 0..<cardButtons.count {
                if cardButtons[i] == sender {
                    pickedCards[clickCount] = cardsInPlay[i]
                }
            }
            //pickedCards[0] = sender
            //Card.isPicked = true
            clickCount += 1
        }
        else {
            updateViewFromModel()
            clickCount = 0
            sender.layer.borderWidth = 3.0
            sender.layer.borderColor = UIColor.blue.cgColor
            for i in 0..<cardButtons.count {
                if cardButtons[i] == sender {
                    pickedCards[clickCount] = cardsInPlay[i]
                }
            }
            clickCount += 1
            //should give blue to current click as well as clear the others
        }
    }

    var triangleCard = ShapeType.Triangle
    var Circle = ShapeType.Circle
    var Square = ShapeType.Square

}

