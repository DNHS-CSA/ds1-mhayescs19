//
//  TranslateController.swift
//  SwiftPortfolio
//
//  Created by Michael Hayes on 3/23/20.
//  Copyright © 2020 Hayes, Michael. All rights reserved.
//

import UIKit

class TranslateController: UIViewController {
    var language: String = "Placeholder"
    
    @IBOutlet weak var textOriginal: UITextField!
    @IBOutlet weak var reversedLabel: UILabel!
    @IBOutlet weak var shorthandLabel: UILabel!
    @IBOutlet weak var pigLatinLabel: UILabel!
    @IBOutlet weak var palindromeCheck: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func translateIt(_ sender: UIButton) {
        let originalArray: [String] = translator(textOriginal: String(textOriginal.text!)) // gets tokenized array of string for use in other translate functions
        
        shorthandLabel.text = createShorthandPhrase(originalArray: originalArray)
        
        
    }
    func translator(textOriginal: String) -> ([String]) {
        // Tokenizer
        let sentenceSpace = " "
        let originalArray: [String] = textOriginal.components(separatedBy: sentenceSpace)
        //let wordCount = originalArray.count
    
        return originalArray
    }
    func createShorthandPhrase(originalArray: [String]) -> String {
        let shortHandArray: [String] = originalArray // defines an empty array the size of the phrases
        var shortHandPhrase: [String] = [String()] // empty string array similar to C version
        let wordCount = shortHandArray.count // counter for number of words to "translate"
        
        var i = 0
        while i <= (wordCount - 1) {
            shortHandPhrase.insert(shorthand(word: [shortHandArray[i]]), at: shortHandPhrase.endIndex)
            i += 1 // i++
        }
        let shortHandForLabel: String = shortHandPhrase.joined(separator: " ")
        return shortHandForLabel
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
