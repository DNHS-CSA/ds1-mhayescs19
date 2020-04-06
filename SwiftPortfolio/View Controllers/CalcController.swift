//
//  CalcController.swift
//  SwiftPortfolio
//
//  Created by Michael Hayes on 3/16/20.
//  Copyright © 2020 Hayes, Michael. All rights reserved.
//

import UIKit

class CalcController: UIViewController {
    // nessecary components of calculator
    @IBOutlet weak var calcAreaLabel: UILabel!
    var initialCalcAreaInputState:(Bool) = true // sets state for first number
    var numberWithDecimal:(Bool) = false
    var calcAreaNumber:(String) = String() // String() = empty string
    var currentText:(String) = String()
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
    // defintion for swipe detector
    @IBOutlet weak var displayDetector: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcAreaLabel.text = " " // makes the calculator display a blank label
        displayDetector.isUserInteractionEnabled = true
        // swipe detector code
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture)) // actual recognizer
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left // defines what direction swipe to look for
        displayDetector.addGestureRecognizer(swipeLeft) // adds the gesture recognizer to the UIImageView "displayDetector"
    }
    @objc func swipeGesture(sender: UISwipeGestureRecognizer?){
        //let range = currentText.index(currentText.endIndex, offsetBy: -2)..<currentText.endIndex
        //currentText.removeSubrange(range)
        //currentText.insert(contentsOf:"", at: currentText.index(currentText.endIndex, offsetBy: -1))
        let size = calcAreaLabel.text!.count
        if (size - 1) == 0 { // if subtracting a digit would leave nothing, to prevent an out of bounds String.index, sets the calcAreaLabel to zero
            calcAreaLabel.text = String(0)
            initialCalcAreaInputState = true // makes sure the next digit pressed overwrites the zero that is set
        }else{
            //let lastDigit = calcAreaLabel.text!.index(calcAreaLabel.text!.endIndex, offsetBy: -2)
            let lastDigit = calcAreaLabel.text!.index(before: calcAreaLabel.text!.endIndex)
            calcAreaLabel.text!.remove(at: lastDigit) // removes last digit
        }
        
        //currentText.remove(at: currentText.index(currentText.endIndex, offsetBy: -1))

    }
    func calculatorHelper(){
        calculateAnswer()
        saveValueofAnswer()
        setCalcAreaLabel(calculation: calcAnswer)
        initialCalcAreaInputState = true
        //calcAreaLabel.count
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
    func resetValues(){
        mathOp = -1
        value1 = 0.0
        value2 = 0.0
        calcAnswer = 0.0
        calcAreaNumber = " "
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
        numberWithDecimal = false
        calcAreaLabel.text = " "
        calcAreaNumber = " "
    }
    func setCalcAreaLabel(calculation: Float){
        calcAreaLabel.text = String(calculation)
        currentText = String(calculation)
    }
    func setCalcAreaLabelInt(calculation: Int){
        calcAreaLabel.text = String(calculation)
        currentText = String(calculation)
    }
    func setCalcAreaLabelString(calculation: String){
        calcAreaLabel.text = String(calculation)
        currentText = String(calculation)
    }
    func concatCalcAreaLabel(keyNumber: String){ // keyNumber = variable name local to the function, "String" =
        if initialCalcAreaInputState { // if initialCalcAreaInputState is true...
            calcAreaNumber = keyNumber
            initialCalcAreaInputState = false // sets state for second number
            setCalcAreaLabelInt(calculation: Int(calcAreaNumber)!) // goes to set label helper
            return
        }else{
            calcAreaNumber = calcAreaNumber + keyNumber // works like concatation in C, adds whatever the keyNumber is to the label
            if keyNumber == "." {
                setCalcAreaLabelString(calculation: String(calcAreaNumber))
                numberWithDecimal = true
                return
            }
            if numberWithDecimal == false {
                setCalcAreaLabelInt(calculation: Int(calcAreaNumber)!)
                return
            }
            setCalcAreaLabel(calculation: Float(calcAreaNumber)!)
        }
    }
    func saveValueofAnswer() {  // method to save value of answer after calc to arg1
        mathOp = -1;          // operator is unassigned after calc
        value1 = 0.0     // arg1 is current display value
        value2 = 0.0            // arg2 is now unassigned
        //calcAreaLabel.text = String(calcAnswer)
    }
    //OPERATOR MANAGEMENT
    @IBAction func pressEqual(_ sender: UIButton) {
        calculateAnswer()
        saveValueofAnswer()
        setCalcAreaLabel(calculation: calcAnswer)
    }
    @IBAction func pressClear(_ sender: UIButton) {
        clearCalcAreaLabel()
        resetValues()
    }
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
    @IBAction func multiplyOp(_ sender: UIButton) {
        saveOperator(opNumber: MULTIPLY)
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
        calculatorHelper()
    }
    @IBAction func cubeOp(_ sender: UIButton) {
        saveOperator(opNumber: CUBE)
        saveValue1()
        calculatorHelper()
    }
    @IBAction func squareOp(_ sender: UIButton) {
        saveOperator(opNumber: SQR)
        saveValue1()
        calculatorHelper()
    }
    //NUMBER MANAGEMENT
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
    // reference code for position access in swift
     /*let greeting = "Guten Tag!"
     greeting[greeting.startIndex]
     // G
     greeting[greeting.index(before: greeting.endIndex)]
     // !
     greeting[greeting.index(after: greeting.startIndex)]
     // u
     let index = greeting.index(greeting.startIndex, offsetBy: 7)
     greeting[index]
     // a
      var welcome = "hello"
      welcome.insert("!", at: welcome.endIndex)
      // welcome now equals "hello!"

      welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
      // welcome now equals "hello there!"
      To remove a single character from a string at a specified index, use the remove(at:) method, and to remove a substring at a specified range, use the removeSubrange(_:) method:

      welcome.remove(at: welcome.index(before: welcome.endIndex))
      // welcome now equals "hello there"

      let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
      welcome.removeSubrange(range)
      // welcome now equals "hello"*/    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
