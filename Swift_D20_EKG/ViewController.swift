//
//  ViewController.swift
//  Swift_D20_EKG
//
//  Created by Evan Grau on 11/15/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonGotPressed() {
        rollDice()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    
    func rollDice() {
        print("We rollin' dem dice")
        
        let rolledNumber = Int.random(in: 1...20)
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
        var pathToSound: String
        
        switch rolledNumber {
            case 1:
                criticalLabel.text = "Critical Miss!"
                // play failwah sound
                pathToSound = Bundle.main.path(forResource: "failwah", ofType: "mp3")!
                break
            case 7:
                // play torpedo sound
                pathToSound = Bundle.main.path(forResource: "torpedo", ofType: "mp3")!
                break
            case 20:
                criticalLabel.text = "Critical Hit!"
                // play zfanfare sound
                pathToSound = Bundle.main.path(forResource: "zfanfare", ofType: "mp3")!
                break
            default:
                criticalLabel.text = "Roll for Charisma"
                // play rolldice sound
                pathToSound = Bundle.main.path(forResource: "rolldice", ofType: "mp3")!
                break
        }
                                                   
        let url = URL(fileURLWithPath: pathToSound)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
        catch {
            print("there's an error hun")
        }
    }
}

