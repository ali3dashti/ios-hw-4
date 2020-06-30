//
//  ViewController.swift
//  ios-cw5-p2
//
//  Created by Ali Dashti on 6/27/20.
//  Copyright © 2020 Ali Dashti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    let backGroungColorSource = backGroundColorSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var counter = 0
    @IBAction func press(_ sender: UIButton) {
        
        print( "press" )
        print(counter)
        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.white, for: .normal)
            turnLabel.text = "O Turn"
        }
        else {
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.blue, for: .normal)
            turnLabel.text = "X Turn"
        }
        
        
        counter += 1
        sender.isEnabled = false
        
        Winning(winner: "X")
        Winning(winner: "O")
        
        
        
    }
    
    
    @IBAction func resetTapped() {
        let newColor = backGroungColorSource.randomColor()
        
        self.restartGame()
        
        view.backgroundColor = newColor
        resetButton.tintColor = newColor
        
    }
    
    
    
    func Winning(winner: String) {
        if  (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner) ||
            (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) ||
            (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) ||
            (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
        {
            print("\(winner) wins")
            
            let alertController = UIAlertController(title: "\(winner) wins", message: "press the button to reset the game", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "restart game", style: .cancel) { (alert) in
                self.restartGame()
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
            
            
            
        }
        
    }
    func restartGame() {
        b1.setTitle("", for: .normal)
        b1.titleLabel?.text = ""
        b1.isEnabled = true
        
        b2.setTitle("", for: .normal)
        b2.titleLabel?.text = ""
        b2.isEnabled = true
        
        b3.setTitle("", for: .normal)
        b3.titleLabel?.text = ""
        b3.isEnabled = true
        
        b4.setTitle("", for: .normal)
        b4.titleLabel?.text = ""
        b4.isEnabled = true
        
        b5.setTitle("", for: .normal)
        b5.titleLabel?.text = ""
        b5.isEnabled = true
        
        b6.setTitle("", for: .normal)
        b6.titleLabel?.text = ""
        b6.isEnabled = true
        
        b7.setTitle("", for: .normal)
        b7.titleLabel?.text = ""
        b7.isEnabled = true
        
        b8.setTitle("", for: .normal)
        b8.titleLabel?.text = ""
        b8.isEnabled = true
        
        b9.setTitle("", for: .normal)
        b9.titleLabel?.text = ""
        b9.isEnabled = true
        
        
        counter = 0
        turnLabel.text = "X Turn"
    }

}
