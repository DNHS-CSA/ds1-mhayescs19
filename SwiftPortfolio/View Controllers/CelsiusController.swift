//
//  CelsiusController.swift
//  SwiftPortfolio
//
//  Created by Hayes, Michael on 3/13/20.
//  Copyright © 2020 Hayes, Michael. All rights reserved.
//

import UIKit

class CelsiusController: UIViewController {

    @IBOutlet weak var degreesFahrenheit: UITextField!
    @IBOutlet weak var degreesCelsius: UILabel!
    
    @IBOutlet weak var freezingPrompt
    : UILabel!
    @IBOutlet weak var sweaterWeatherPrompt: UILabel!
    @IBOutlet weak var beachDayPrompt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        freezingPrompt.alpha = 0
        sweaterWeatherPrompt.alpha = 0
        beachDayPrompt.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tempIt(sender: UIButton) {
        freezingPrompt.alpha = 0
        sweaterWeatherPrompt.alpha = 0
        beachDayPrompt.alpha = 0
        let degreesInFahrenheit = Double(degreesFahrenheit.text!)
        let degreeCelsius = (degreesInFahrenheit! - 32) * 5/9
        degreesCelsius.text = String(degreeCelsius)
        if degreesInFahrenheit! <= 32 {
            freezingPrompt.alpha = 1
        }
       if degreesInFahrenheit! > 32 && degreesInFahrenheit! <= 69 {
            sweaterWeatherPrompt.alpha = 1
        }
        if degreesInFahrenheit! > 69 {
            beachDayPrompt.alpha = 1
        }
    degreesFahrenheit.resignFirstResponder() // makes keyboard go away
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
