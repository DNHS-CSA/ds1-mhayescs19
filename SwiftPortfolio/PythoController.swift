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
        @IBOutlet var triangleImage: [UILabel]!
    
         // Loads at initialization
         override func viewDidLoad() {
             super.viewDidLoad()
        
         }

         // IBAction created with Drag from Storyboard
        @IBAction func calculate(sender: UIButton) {
             // let is for values that are not modified
            var triangle = (side1: 0.0, side2: 0.0, hypotenuse: 0.0)
            triangle.side1 = Double(side1.text!)! // Input value, !(Bang) avoids errors
            triangle.side2 = Double(side2.text!)!

             // Pythagorean Calculation
            triangle.hypotenuse = sqrt( (triangle.side1 * triangle.side1) + (triangle.side2 * triangle.side2) )

             // Set calculation to screen
            side3.text = String(triangle.hypotenuse)
             print("Pyth  \(side3.text!)")
            for side in self.triangleImage {
                side.alpha = 0
            }
            side1.resignFirstResponder()
            side2.resignFirstResponder()
        // Do any additional setup after loading the view.
         }
    func hideTriangle() {
        for side in self.triangleImage {
            side.alpha = 0
        }
        
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
