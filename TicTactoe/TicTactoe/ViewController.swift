//
//  ViewController.swift
//  TicTactoe
//
//  Created by asingiri on 5/11/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var turn = 0
    var playerTurn = [(0, "blue"), (1, "red")]
    var TTTArray = [" ", "gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray"]
    
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    
    @IBOutlet weak var winnerLabel: UILabel!
    func changeTurn(){
        turn == 0 ? (turn = 1) : (turn = 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print(sender.tag)
        if TTTArray[sender.tag] != "gray"{
            winnerLabel.text = "Please choose a non-gray square"
        } else{
            if turn == 0{
                sender.backgroundColor = UIColor.blue
                TTTArray[sender.tag] = "blue"
                winnerCheck()
                changeTurn()
            } else{
                sender.backgroundColor = UIColor.red
                TTTArray[sender.tag] = "red"
                winnerCheck()
                changeTurn()
            }
            
        }
        
   }

    func winnerCheck(){
        if ((TTTArray[1] == TTTArray[2] && TTTArray[1] == TTTArray[3]) && TTTArray[1] != "gray"){
           winnerLabel.text = "\(TTTArray[1]) won!!!!"
       }
        else if ((TTTArray[1] == TTTArray[4] && TTTArray[1] == TTTArray[7]) && TTTArray[1] != "gray"){
            winnerLabel.text = "\(TTTArray[1]) won!!!!"
        }
        else if ((TTTArray[1] == TTTArray[5] && TTTArray[1] == TTTArray[9]) && TTTArray[1] != "gray"){
            winnerLabel.text = "\(TTTArray[1]) won!!!!"
        }
        else if ((TTTArray[4] == TTTArray[5] && TTTArray[4] == TTTArray[6]) && TTTArray[4] != "gray"){
            winnerLabel.text = "\(TTTArray[4]) won!!!!"
        }
        else if ((TTTArray[7] == TTTArray[8] && TTTArray[7] == TTTArray[9]) && TTTArray[7] != "gray"){
            winnerLabel.text = "\(TTTArray[7]) won!!!!"
        }
        else if ((TTTArray[2] == TTTArray[4] && TTTArray[2] == TTTArray[6]) && TTTArray[2] != "gray"){
            winnerLabel.text = "\(TTTArray[2]) won!!!!"
        }
        else if ((TTTArray[3] == TTTArray[6] && TTTArray[3] == TTTArray[9]) && TTTArray[3] != "gray"){
            winnerLabel.text = "\(TTTArray[3]) won!!!!"
        }
        else if ((TTTArray[3] == TTTArray[5] && TTTArray[3] == TTTArray[7]) && TTTArray[3] != "gray"){
            winnerLabel.text = "\(TTTArray[3]) won!!!!"
        }
  }


    @IBAction func resetTheGame(_ sender: Any) {
        b1.backgroundColor = UIColor.gray
        B2.backgroundColor = UIColor.gray
        b3.backgroundColor = UIColor.gray
        b4.backgroundColor = UIColor.gray
        b5.backgroundColor = UIColor.gray
        b6.backgroundColor = UIColor.gray
        b7.backgroundColor = UIColor.gray
        b8.backgroundColor = UIColor.gray
        b9.backgroundColor = UIColor.gray
        TTTArray = [" ", "gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray"]
        turn = 0
        winnerLabel.text = ""
    }
}
