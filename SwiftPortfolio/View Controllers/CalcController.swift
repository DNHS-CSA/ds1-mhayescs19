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
    var value1:(Double) = 0
    var value2:(Double) = 0
    var mathOp:(Int) = 0
    var calcAnswer:(Float) = 0
    // new place for "#define" from C, use let instead
    let PLUS = 0
    let MINUS = 1
    let MULTIPLY = 2
    let DIVIDE = 3
    let MODULO = 4
    let SQR = 5
    let CUBE = 6
    let FRACTION = 7
    let SQRT = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcAreaLabel.text = " " // makes the calculator display a blank label
        // Do any additional setup after loading the view.
    }
    func calculateIt(value1: Double, value2: Double, mathOp: Int) -> Float {
        switch mathOp {
                    case PLUS:
                        //   arg2 = calcAreaNumber.doubleValue;
                        calcAnswer = Float(value1 + value2)
                        break
                    case MINUS:
                        //  arg2 = calcAreaNumber.doubleValue;
                        calcAnswer = Float(value1 - value2)
                        break
                    case DIVIDE:
                      //   arg2 = calcAreaNumber.doubleValue;
                        calcAnswer = Float(value1 / value2)
                        break
                    case MULTIPLY:
                       // arg2 = calcAreaNumber.doubleValue;
                        calcAnswer = Float(value1 * value2)
                        break
                    case MODULO:
                        //arg2 = calcAreaNumber.doubleValue;
                        calcAnswer = Float(Int(value1) % Int(value2))
                        break
                    case SQR:
                        calcAnswer = Float(pow(value1, 2))
                        //calcAnswer = arg1 * arg1;
                        break
                    case SQRT:
                        calcAnswer = Float(pow(value1, 0.5))
                        //calcAnswer = arg1 * arg1;
                        break
                    case CUBE:
                        calcAnswer = Float((value1 * value1) * value1)
                        break
                    case FRACTION:
                        calcAnswer = Float(1 / value1)
                        break
                    case -1:
                        calcAnswer = Float(value1)
                        break
                    default:
                        break
                }
            return calcAnswer
        }
    func calculateAnswer(){
        value2 = Double(calcAreaLabel.text!)!
        calcAnswer = calculateIt(value1: value1, value2: value2, mathOp: mathOp)
    }
    func saveOperator(opNumber: Int){
        mathOp = opNumber
    }
    func saveValue1(){
        value1 = Double(calcAreaLabel.text!)! // use of a bunch of bangs to avoid errors; unsure of use of bang on the double cast since "value1" is a double var
    }
    func clearCalcAreaLabel(){
        initialCalcAreaInputState = true
        calcAreaLabel.text = " "
        calcAreaNumber = " "
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
    func saveValueofAnswer() {  // method to save value of answer after calc to arg1
        mathOp = -1;          // operator is unassigned after calc
        value1 = 0.0     // arg1 is current display value
        value2 = 0.0            // arg2 is now unassigned
        calcAreaNumber = String(calcAnswer)
    }
    @IBAction func pressEqual(_ sender: UIButton) {
        calculateAnswer()
        saveValueofAnswer()
        setCalcAreaLabel()
    }
    
    @IBAction func press1(_ sender: UIButton) {
        let keyNumber:(String) = "1"
        concatCalcAreaLabel(keyNumber: keyNumber) // (what the new variable is going to be in the func: variable from current function)
    }
    //OPERATOR MANAGEMENT
    @IBAction func minusOp(_ sender: UIButton) {
        saveOperator(opNumber: MINUS)
        saveValue1()
        clearCalcAreaLabel()
    }
    @IBAction func plusOp(_ sender: UIButton) {
        saveOperator(opNumber: PLUS)
        saveValue1()
        clearCalcAreaLabel()
    }
    @IBAction func multiplyOp(_ sender: UIButton) {        saveOperator(opNumber: MULTIPLY)
        saveValue1()
        clearCalcAreaLabel()
    }
    @IBAction func divideOp(_ sender: UIButton) {
        saveOperator(opNumber: DIVIDE)
        saveValue1()
        clearCalcAreaLabel()
    }
    @IBAction func squareRootOp(_ sender: UIButton) {
        saveOperator(opNumber: SQRT)
        saveValue1()
        clearCalcAreaLabel()
    }
    @IBAction func fractionOp(_ sender: UIButton) {
        saveOperator(opNumber: FRACTION)
        saveValue1()
        clearCalcAreaLabel()
    }
    @IBAction func cubeOp(_ sender: UIButton) {
        saveOperator(opNumber: CUBE)
        saveValue1()
        clearCalcAreaLabel()
    }
    @IBAction func squareOp(_ sender: UIButton) {
        saveOperator(opNumber: SQR)
        saveValue1()
        clearCalcAreaLabel()
    }
    //NUMBER MANAGEMENT
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
