//
//  ViewController.swift
//  tipster
//
//  Created by asingiri on 5/11/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var baseAmount: UILabel!
    
    var baseValue = Float(0)

    @IBOutlet weak var mediumTipLabel: UILabel!
    @IBOutlet weak var maxTipLabel: UILabel!
    @IBOutlet weak var minTipLabel: UILabel!
    
    @IBOutlet weak var maxTaxValueLabel: UILabel!
    @IBOutlet weak var mediumTaxValueLabel: UILabel!
    @IBOutlet weak var minTaxValueLabel: UILabel!
    
    @IBOutlet weak var mediumTaxTotal: UILabel!
    @IBOutlet weak var maxTaxTotal: UILabel!
    @IBOutlet weak var minTaxTotal: UILabel!
    
    var minTax = Float(5)
    var mediumTax = Float(10)
    var maxTax = Float(15)
    
    @IBOutlet weak var taxSlider: UISlider!
    @IBOutlet weak var groupSlider: UISlider!
    
    @IBOutlet weak var dotButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        baseAmount.text = String(0)
        dotButton.isEnabled = true
        minTipLabel.text = String(minTax) + "%"
        mediumTipLabel.text = String(mediumTax) + "%"
        maxTipLabel.text = String(maxTax) + "%"
        minTaxTotal.text = String(0)
        mediumTaxTotal.text = String(0)
        maxTaxTotal.text = String(0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func groupNumberSlider(_ sender: Any) {
//      print(minTaxTotal.text)
//        print(round(groupSlider.value))
//      print((Float(minTotal)!/round(groupSlider.value)))
        
        if let minTotal = minTaxTotal.text{
            minTaxTotal.text = String((Float(minTotal)!/round(groupSlider.value)))
            print(Float(minTotal)!)
            print(round(groupSlider.value))
            print((Float(minTotal)!/round(groupSlider.value)))
            
        }else if let mediumTotal = mediumTaxTotal.text{
            mediumTaxTotal.text = String((Float(mediumTotal)!/round(groupSlider.value)))
        }
        else if let maxtotal = maxTaxTotal.text{
            maxTaxTotal.text = String((Float(maxtotal)!/round(groupSlider.value)))
        }
        else{
            print("Do Nothing")
        }
    }

    @IBAction func tipSlide(_ sender: Any) {
        minTipLabel.text = String(minTax + Float(taxSlider.value)) + "%"
        mediumTipLabel.text = String(mediumTax + Float(taxSlider.value)) + "%"
        maxTipLabel.text = String(maxTax + Float(taxSlider.value)) + "%"
        
        minTaxValueLabel.text = String((baseValue * (minTax + Float(taxSlider.value)))/100.0)
        minTaxTotal.text = String(baseValue + (baseValue * (minTax + Float(taxSlider.value)))/100.0)
        
        mediumTaxValueLabel.text = String((baseValue * (mediumTax + Float(taxSlider.value)))/100.0)
        mediumTaxTotal.text = String(baseValue + (baseValue * (mediumTax + Float(taxSlider.value)))/100.0)
        
        maxTaxValueLabel.text = String((baseValue * (maxTax + Float(taxSlider.value)))/100.0)
        maxTaxTotal.text = String(baseValue + (baseValue * (maxTax + Float(taxSlider.value)))/100.0)
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
            baseAmount.text = ""
            baseValue = Float(0)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if baseAmount.text == "0"{
            baseAmount.text = String(sender.tag)
        }
        else{
            if sender.tag == 12 {
                baseAmount.text = baseAmount.text! + "."
                dotButton.isEnabled = false
            }
            else{
               baseAmount.text = baseAmount.text! + String(sender.tag)
            }
        }
        if let enteredAmount = baseAmount.text{
           baseValue = Float(enteredAmount)!
        }else{
            print("Do Nothing")
        }
        
        minTaxValueLabel.text = String((baseValue * minTax)/100.0)
        minTaxTotal.text = String(baseValue + (baseValue * minTax)/100.0)
        
        mediumTaxValueLabel.text = String((baseValue * mediumTax)/100.0)
        mediumTaxTotal.text = String(baseValue + (baseValue * mediumTax)/100.0)
        
        maxTaxValueLabel.text = String((baseValue * maxTax)/100.0)
        maxTaxTotal.text = String(baseValue + (baseValue * maxTax)/100.0)
    }
}

