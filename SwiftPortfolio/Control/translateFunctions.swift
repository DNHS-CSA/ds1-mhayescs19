//
//  translateFunctions.swift
//  SwiftPortfolio
//
//  Created by Michael Hayes on 3/25/20.
//  Copyright © 2020 Hayes, Michael. All rights reserved.
//

import Foundation
    // special rule literals
    let FOR = "FOR" //"4"
    let TWO = "TWO" //"2"
    let AND = "AND" //"&"
    let YOU = "YOU" //"U"
func yesVowel(letter: String) -> Int {
    let letter = letter.uppercased()
    if (letter == "A" || letter == "E" || letter == "I" || letter == "O" || letter == "U"){
        return 0
     }
        return 1
}
func shorthand(word: [String]) -> String {
    var word:String = word.joined()
    // "rule followers"
    let wordInQuestion:String = word.uppercased() // converts array to string and makes it UPPERCASED
    if(wordInQuestion == FOR){ // checks for special word "for"
        return "4"
    }
    if(wordInQuestion == AND){ //checks for special word "and"
        return "&"
    }
    if(wordInQuestion == TWO){ // checks for special word "two"
          return "2"
    }
    if(wordInQuestion == YOU){ // checks for special word "you"
        return "u"
    }
    
    var masterCounter = 0
    let wordLength = word.count
    
    while masterCounter < wordLength {
        if yesVowel(letter: String(word[word.index(word.startIndex, offsetBy: masterCounter)])) == 0 {
            
            var letterMover = masterCounter
            while letterMover < wordLength {
                /*
                 * Moving letters using String Index
                 * 1. remove indentified vowel
                 * 1. uses the index to take the letter one to the right of the vowel
                 * 2. takes that character and moves it over to rewrite over the vowel
                 */
                
                word.insert(word[word.index(word.startIndex, offsetBy: letterMover + 1)], at: word.index(word.startIndex, offsetBy: letterMover)) // moves letters over one to replace the vowel (really inserts character in front of other character)
                //word.remove(at: word.index(word.startIndex, offsetBy: letterMover)) // removes character at current place (vowel character)
                letterMover += 1
            }
            masterCounter -= 1 // if a vowel is detected, recheck that character again
        }
        masterCounter += 1 // moves to next character in word
    }
    return word
}
