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
        @IBOutlet var triangleLabels: [UILabel]!
        @IBOutlet weak var triangleImage: UIImageView!
        @IBOutlet weak var toggleTriangleImage: UIButton!
        let triangleOnPrompt = "View Triangle"
        let triangleOffPrompt = "Hide Triangle"
        var click = 0
         // Loads at initialization
        override func viewDidLoad() {
             super.viewDidLoad()
            // sets default state of the hidden triangle view
            hideTriangle()
            triangleImage.alpha = 0
         }
         func hideTriangle() {
            // counter is now in the "side" variable, automatically goes through only all of the elements. This loop is i < 3
             for side in self.triangleLabels {
                 side.alpha = 0
             }
            triangleImage.alpha = 0
         }
         func showTriangle() {
             for side in self.triangleLabels {
                 side.alpha = 1
             }
            triangleImage.alpha = 1
         }
         // IBAction created with Drag from Storyboard
         @IBAction func calculate(sender: UIButton) {
             // let is for values that are not modified
            var triangle = (side1: 0.0, side2: 0.0, hypotenuse: 0.0)
            triangle.side1 = Double(side1.text!)! // Input value, !(Bang) avoids errors
            triangle.side2 = Double(side2.text!)!

             // Pythagorean Calculation
            triangle.hypotenuse = sqrt( (triangle.side1 * triangle.side1) + (triangle.side2 * triangle.side2) )

             // Set calculation to label below hypotenuse tag
            side3.text = String(triangle.hypotenuse)
             print("Pyth  \(side3.text!)")
            
            // sets the calculations to the triangle image
            triangleLabels[0].text = String(triangle.side1)
            triangleLabels[1].text = String(triangle.side2)
            triangleLabels[2].text = String(triangle.hypotenuse)
            side1.resignFirstResponder() // makes the keyboard go away
            side2.resignFirstResponder() // makes the keyboard go away
         }
         @IBAction func toggleTriangleImage(sender: UIButton) {
            // uses a counter that cycles between 1 and 0 to hide or show the triangle image
             if click == 0 {
                 showTriangle()
                 click+=1
                 toggleTriangleImage.setImage(UIImage(systemName: "triangle"), for: .normal)
                 return
             }else
             {
                 hideTriangle()
                 click-=1
                toggleTriangleImage.setImage(UIImage(systemName: "triangle.fill"), for: .normal)

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
