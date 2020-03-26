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
        translator(textOriginal: String(textOriginal.text!))
    }
    func translator(textOriginal: String){
        // Tokenizer
        let sentenceSpace = " "
        let originalArray: [String] = textOriginal.components(separatedBy: sentenceSpace)
        let wordCount = originalArray.count
        var reversedArray: [String] = textOriginal.components(separatedBy: sentenceSpace)// defines an empty array the size of the phrases
    }
    func createShorthandPhrase(word: String, wordCount: Int){
        for wordCount in word {
    
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
