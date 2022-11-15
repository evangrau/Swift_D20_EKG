//
//  ViewController.swift
//  Swift_D20_EKG
//
//  Created by Evan Grau on 11/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonGotPressed() {
        rollDice()
    }
    
    func rollDice() {
        print("We rollin' dem dice")
        
        let rolledNumber = Int.random(in: 1...20)
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
    }
}

