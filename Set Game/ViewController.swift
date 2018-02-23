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
    var fullDeck = createDeck()
    var clickCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0...11 {
            let button = cardButtons[i]
            let card = fullDeck[i]
            button.setTitle(card.cardShape.rawValue, for: .normal)
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //lazy var borderColor = button.layer.borderWidth = 3.0
    
    @IBAction func newGame(_ sender: UIButton) {
            }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if clickCount < 3 {
            sender.layer.borderWidth = 3.0
            sender.layer.borderColor = UIColor.blue.cgColor
            clickCount += 1
        }
        else{
            clickCount = 0
            for index in cardButtons.indices {
                let button = cardButtons[index]
                button.layer.borderColor = UIColor.white.cgColor
            }
        }
    }
    let attributedColorRed: [NSAttributedStringKey : Any] = [
        .foregroundColor : UIColor.red
        ]
    let attributedColorGreen: [NSAttributedStringKey : Any] = [
        .foregroundColor : UIColor.green
        ]
    let attributedColorPurple: [NSAttributedStringKey : Any] = [
        .foregroundColor : UIColor.purple
        ]
    
    let attributedShadeFilled: [NSAttributedStringKey : Any] = [
        .strokeWidth : -1.0
        //filled in
    ]
    let attributedShadeStriped: [NSAttributedStringKey : Any] = [
        .foregroundColor : 0.15
        //striped. Test this
    ]
    let attributedShadeEmpty: [NSAttributedStringKey : Any] = [
        .strokeWidth : 5.0
        //outline
    ]
    
    
    
    lazy var shapeColor = NSAttributedString(string : triangleCard.rawValue, attributes: attributedColorRed)

    
    

    var triangleCard = ShapeType.Triangle
    var Circle = ShapeType.Circle
    var Square = ShapeType.Square

}

