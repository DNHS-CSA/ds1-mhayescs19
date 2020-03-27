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
    var wordLength = word.count
    
    while masterCounter < wordLength {
        if yesVowel(letter: String(word[word.index(word.startIndex, offsetBy: masterCounter)])) == 0 {
                /*
                 * Moving letters using String Index
                 * 1. remove indentified vowel
                 * 1. uses the index to take the letter one to the right of the vowel
                 * 2. takes that character and moves it over to rewrite over the vowel
                 */
                
                word.remove(at: word.index(word.startIndex, offsetBy: masterCounter)) // removes character at current place (vowel character)
            
            masterCounter -= 1 // if a vowel is detected, recheck that character again
            wordLength -= 1 // if a vowel is removed, then the word length decreases by one
        }
        masterCounter += 1 // moves to next character in word
    }
    return word
}
func piglatin(word: [String]) -> String{
    var word:String = word.joined() // converts array to string
    
    var masterCounter = 0
    let wordLength = word.count
    
    while masterCounter < wordLength {
        var mover = 0 // counter to align with movement of characters
        if yesVowel(letter: String(word[word.index(word.startIndex, offsetBy: masterCounter)])) == 0 {
            return word + "yay"
        }else{
            if yesVowel(letter: String(word[word.index(word.startIndex, offsetBy: mover)])) == 1 {
                        /*
                         * Moving letters using String Index
                         * 1. remove indentified vowel
                         * 1. uses the index to take the letter one to the right of the vowel
                         * 2. takes that character and moves it over to rewrite over the vowel
                         */
                        word.insert(word[word.index(word.startIndex, offsetBy: masterCounter)], at: word.index(word.endIndex, offsetBy: 0)) // moves first character to end of word
                        word.remove(at: word.index(word.startIndex, offsetBy: masterCounter)) // deletes first character
                    
                    mover -= 1
                }else if yesVowel(letter: String(word[word.index(word.startIndex, offsetBy: mover)])) == 0 {
                    return word + "ay" // returns pigged word
                }
                masterCounter += 1
            }
        }
    return word
}
func palindrome (word: [String]) -> String {
    var word: String = word.joined()
    
    return word
}
