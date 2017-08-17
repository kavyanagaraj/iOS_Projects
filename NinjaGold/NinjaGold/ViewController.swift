//
//  ViewController.swift
//  NinjaGold
//
//  Created by asingiri on 5/11/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var earnOrLostLabel: UILabel!
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        score = 0
        playerScore.text = String(score)
        earnOrLostLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func unsafeRandomIntFrom(start: Int, to end: Int) -> Int {
        if start > end{
            var start = start
            var end = end
            swap(&start, &end)
        }
        return Int(arc4random_uniform(UInt32(end - start + 1))) + start
    }
    
    @IBAction func buildingBlocksPressed(_ sender: UIButton) {
        if sender.tag == 1{
            let farmRandom = Int(arc4random_uniform(UInt32(11))) + 10
            score += farmRandom
            earnOrLostLabel.text = "You earned \(farmRandom)"
        }
        else if sender.tag == 2{
            let caveRandom = Int(arc4random_uniform(UInt32(6))) + 5
            score += caveRandom
            earnOrLostLabel.text = "You earned \(caveRandom)"
        }
        else if sender.tag == 3{
            let houseRandom = Int(arc4random_uniform(UInt32(2))) + 3
            score += houseRandom
            earnOrLostLabel.text = "You earned \(houseRandom)"
        }
        else if sender.tag == 4{
            let houseRandom = unsafeRandomIntFrom(start: -50, to: 50)
//            let houseRandom = Int(arc4random_uniform(UInt32(51)))
            score += houseRandom
            if houseRandom < 0{
                earnOrLostLabel.text = "You lost \(houseRandom * -1)"
            }
            else{
                earnOrLostLabel.text = "You earned \(houseRandom)"
            }
        }
        else if sender.tag == 5{
            reset()
        }
        playerScore.text = String(score)
    }
    
    func reset(){
        score = 0
        playerScore.text = String(score)
        earnOrLostLabel.text = ""
    }
}

