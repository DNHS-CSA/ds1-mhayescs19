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
        reversedLabel.text = createReversedPhrase(originalArray: originalArray)
        shorthandLabel.text = createShorthandPhrase(originalArray: originalArray)
        pigLatinLabel.text = createPigLatinPhrase(originalArray: originalArray)
        palindromeCheck.text = createPalindromePhrase(originalArray: originalArray)
        textOriginal.resignFirstResponder()
    }
    func translator(textOriginal: String) -> ([String]) {
        // Tokenizer
        let sentenceSpace = " "
        let originalArray: [String] = textOriginal.components(separatedBy: sentenceSpace)
        //let wordCount = originalArray.count
    
        return originalArray
    }
    func createShorthandPhrase(originalArray: [String]) -> String {
        let shortHandArray: [String] = originalArray // copies array size of original for the translation
        var shortHandPhrase: [String] = [String()] // empty string array similar to C version
        let wordCount = shortHandArray.count // counter for number of words to "translate"
        
        var i = 0
        while i <= (wordCount - 1) {
            shortHandPhrase.insert(shorthand(word: [shortHandArray[i]]), at: shortHandPhrase.endIndex)
            i += 1 // i++
        }
        let shortHandForLabel: String = shortHandPhrase.joined(separator: " ") // mimics concat of C, uses the characters in the array
        return shortHandForLabel
    }
    func createPigLatinPhrase(originalArray: [String]) -> String {
        let pigLatinArray: [String] = originalArray // copies array size of original for the translation
        var pigLatinPhrase: [String] = [String()] // empty string array similar to C version
        let wordCount = pigLatinArray.count // counter for number of words to "translate"
        
        var i = 0
        while i <= (wordCount - 1) {
            pigLatinPhrase.insert(piglatin(word: [pigLatinArray[i]]), at: pigLatinPhrase.endIndex)
            i += 1 // i++
        }
        let pigLatinForLabel: String = pigLatinPhrase.joined(separator: " ") // mimics concat of C, uses the characters in the array
        return pigLatinForLabel
    }
    func createReversedPhrase(originalArray: [String]) -> String {
        let reversedArray: [String] = originalArray // copies array size of original for the translation
        var reversedPhrase: [String] = [String()] // empty string array similar to C version
        let wordCount = reversedArray.count // counter for number of words to "translate"
        
        var i = 0
        while i <= (wordCount - 1) {
            reversedPhrase.insert(reversed(word: [reversedArray[i]]), at: reversedPhrase.endIndex)
            i += 1 // i++
        }
        let reversedForLabel: String = reversedPhrase.joined(separator: " ") // mimics concat of C, uses the characters in the array
        return reversedForLabel
    }
    func createPalindromePhrase(originalArray: [String]) -> String {
        let palindromeArray: [String] = originalArray // defines an empty array the size of the phrases
        
        let compactedPhrase: String = palindromeArray.joined().lowercased() // makes the array a string with no spaces between elements
        if compactedPhrase == String(compactedPhrase.lowercased().reversed()) {
            let palindromeForLabel = "Is a palindrome" // excess line, but used to follow format
            return palindromeForLabel
        }else if compactedPhrase != String(compactedPhrase.lowercased().reversed()){
            let palindromeForLabel = "Not a palindrome"
            return palindromeForLabel
        }
        return "Critical Error" // code should not reach this return
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
