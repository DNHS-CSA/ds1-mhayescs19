//
//  CalcController.swift
//  SwiftPortfolio
//
//  Created by Michael Hayes on 3/16/20.
//  Copyright © 2020 Hayes, Michael. All rights reserved.
//

import UIKit

class CalcController: UIViewController {

    @IBOutlet weak var calcAreaLabel: UILabel!
    var initialCalcAreaInputState:(Bool) = true // sets state for first number
    var calcAreaNumber:(String) = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcAreaLabel.text = " " // makes the calculator display a blank label
        // Do any additional setup after loading the view.
    }
    func setCalcAreaLabel (){
        calcAreaLabel.text = calcAreaNumber
    }
    func concatCalcAreaLabel(keyNumber: String){ // keyNumber = variable name local to the function, "String" =
        if initialCalcAreaInputState { // if initialCalcAreaInputState is true...
            calcAreaNumber = keyNumber
            initialCalcAreaInputState = false // sets state for second number
        }else{
            calcAreaNumber = calcAreaNumber + keyNumber // works like concatation in C, adds whatever the keyNumber is to the label
        }
        setCalcAreaLabel() // goes to set label helper
    }
    @IBAction func press1(_ sender: UIButton) {
        let keyNumber:(String) = "1"
        concatCalcAreaLabel(keyNumber: keyNumber) // (what the new variable is going to be in the func: variable from current function)
    }
    @IBAction func press2(_ sender: UIButton) {
        let keyNumber:(String) = "2"
        concatCalcAreaLabel(keyNumber: keyNumber)
    }
    @IBAction func press3(_ sender: UIButton) {
        let keyNumber:(String) = "3"
        concatCalcAreaLabel(keyNumber: keyNumber)
    }
    @IBAction func press4(_ sender: UIButton) {
        let keyNumber:(String) = "4"
        concatCalcAreaLabel(keyNumber: keyNumber)
    }
    @IBAction func press5(_ sender: UIButton) {
        let keyNumber:(String) = "5"
        concatCalcAreaLabel(keyNumber: keyNumber)
    }
    @IBAction func press6(_ sender: UIButton) {
        let keyNumber:(String) = "6"
        concatCalcAreaLabel(keyNumber: keyNumber)
    }
    @IBAction func press7(_ sender: UIButton) {
        let keyNumber:(String) = "7"
        concatCalcAreaLabel(keyNumber: keyNumber)
    }
    @IBAction func press8(_ sender: UIButton) {
        let keyNumber:(String) = "8"
        concatCalcAreaLabel(keyNumber: keyNumber)
    }
    @IBAction func press9(_ sender: UIButton) {
        let keyNumber:(String) = "9"
        concatCalcAreaLabel(keyNumber: keyNumber)
    }
    @IBAction func press0(_ sender: UIButton) {
        let keyNumber:(String) = "0"
        concatCalcAreaLabel(keyNumber: keyNumber)
    }
    @IBAction func pressDecimal(_ sender: UIButton) {
        let keyNumber:(String) = "."
        concatCalcAreaLabel(keyNumber: keyNumber)
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
