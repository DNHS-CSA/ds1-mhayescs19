//
//  PythoController.swift
//  SwiftPortfolio
//
//  Created by Hayes, Michael on 3/11/20.
//  Copyright © 2020 Hayes, Michael. All rights reserved.
//

import UIKit

class PythoController: UIViewController {
    
        // IBOutlet connects to Storyboard items, I had problems with Drag
         @IBOutlet weak var side1: UITextField!
         @IBOutlet weak var side2: UITextField!
         @IBOutlet weak var side3: UILabel!
         
         // Loads at initialization
         override func viewDidLoad() {
             super.viewDidLoad()
            
            side1.text = "0.0"
            side2.text = "0.0"
            side3.text = "0.0"
         }

         // IBAction created with Drag from Storyboard
        @IBAction func calculate(sender: UIButton) {
             // let is for values that are not modified
             let s1 = Float(side1.text!) // Input value, !(Bang) avoids errors
             let s2 = Float(side2.text!)

             // Pythagorean Calculation
             let s3 = sqrt( (s1! * s1!) + (s2! * s2!) )

             // Set calculation to screen
             side3.text = String(s3)
             print("Pyth  \(side3.text!)")
        // Do any additional setup after loading the view.
         }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
