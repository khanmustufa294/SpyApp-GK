//
//  AlphanumericCesarCipher.swift
//  SpyApp
//
//  Created by Ghulam Khan on 9/12/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct AlphaNumericCesarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String {
        
        var encoded = ""
        if (isAlphaNumeric(plaintext)){
            if Int32(secret) == nil {
                return "Enter a valid shift key"
            }
            if Int32(secret) == 0 {
                return "The shift key should be more than 0"
            }
            var shiftByForChar = Int32(secret)!
            var shiftByForDigit = Int32(secret)!
            if shiftByForChar <= -26 {
                shiftByForChar = Int32(secret)! % -26
            }
            if shiftByForChar >= 26 {
                shiftByForChar = Int32(secret)! % 26
            }
            if shiftByForDigit <= -9 {
                shiftByForDigit = Int32(secret)! % -9
            }
            if shiftByForDigit >= 9 {
                shiftByForDigit = Int32(secret)! % 9
            }
            print("Char: \(shiftByForChar)")
            let newText = plaintext.uppercased()
            print ("Digit: \(shiftByForDigit)")
        for character in newText {
            let unicode = character.unicodeScalars.first!.value
            //print ("Unicode: \(unicode)")
            if isChar(character) {
                var shiftedUnicode = Int32(unicode) + shiftByForChar
                if (shiftedUnicode < 65) {
                    let toActuallyShift = 64 - shiftedUnicode
                     shiftedUnicode = 90 - toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                   // print ("ShiftedUnicode < 65: \(shiftedUnicode)")
                    continue
                }
                 else if (shiftedUnicode > 90) {
                    let toActuallyShift = shiftedUnicode - 90
                     shiftedUnicode = 64 + toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                   // print ("ShiftedUnicode > 90: \(shiftedUnicode)")
                     continue
                }
                else {
                let shiftedUnicode = Int32(unicode) + shiftByForChar
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
              //  print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                }
            }
            else {
                var shiftedUnicode = Int32(unicode) + shiftByForDigit
                print("shifted: \(shiftedUnicode)")
                if (shiftedUnicode < 48) {
                    let toActuallyShift = 47 - shiftedUnicode
                    shiftedUnicode = 57 - toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    continue
                }
                if (shiftedUnicode > 57) {
                    let toActuallyShift = shiftedUnicode - 57
                    shiftedUnicode = 47 + toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    continue
                }
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
                print ("ShiftedUnicode neutral: \(shiftedUnicode)")
            }
        }
        }
        else {
            print(plaintext)
            return "Please enter a valid alpha numeric string"
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String {
        
        var decoded = ""
        if (isAlphaNumeric(plaintext)){
            if Int32(secret) == nil {
                return "Enter a valid shift key"
            }
            if Int32(secret) == 0 {
                return "The shift key should be more than 0"
            }
            var shiftByForChar = Int32(secret)!
            var shiftByForDigit = Int32(secret)!
            if shiftByForChar <= -26 {
                shiftByForChar = Int32(secret)! % -26
            }
            if shiftByForChar >= 26 {
                shiftByForChar = Int32(secret)! % 26
            }
            if shiftByForDigit <= -9 {
                shiftByForDigit = Int32(secret)! % -9
            }
            if shiftByForDigit >= 9 {
                shiftByForDigit = Int32(secret)! % 9
            }
            print("Char: \(shiftByForChar)")
            let newText = plaintext.uppercased()
            print ("Digit: \(shiftByForDigit)")
            for character in newText {
                let unicode = character.unicodeScalars.first!.value
                print ("Unicode: \(unicode)")
                if isChar(character) {
                    var shiftedUnicode = Int32(unicode) - shiftByForChar
                    if (shiftedUnicode < 65) {
                        let toActuallyShift = 64 - shiftedUnicode
                        shiftedUnicode = 90 - toActuallyShift
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                       // print ("ShiftedUnicode < 65: \(shiftedUnicode)")
                        continue
                    }
                    else if (shiftedUnicode > 90) {
                        let toActuallyShift = shiftedUnicode - 90
                        shiftedUnicode = 64 + toActuallyShift
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                       // print ("ShiftedUnicode > 90: \(shiftedUnicode)")
                        continue
                    }
                    else {
                        let shiftedUnicode = Int32(unicode) - shiftByForChar
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                       // print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                    }
                }
                else {
                    var shiftedUnicode = Int32(unicode) - shiftByForDigit
                    if (shiftedUnicode < 48) {
                        let toActuallyShift = 47 - shiftedUnicode
                        shiftedUnicode = 57 + toActuallyShift
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                        continue
                    }
                    if (shiftedUnicode > 57) {
                        let toActuallyShift = shiftedUnicode - 57
                        shiftedUnicode = 47 + toActuallyShift
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                        continue
                    }
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    decoded = decoded + shiftedCharacter
                    print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                }
            }
        }
        else {
            print(plaintext)
            return "Please enter a valid alpha numeric string"
        }
        return decoded
    }
    
    func isAlphaNumeric (_ key: String) -> Bool  {
       
        let newKey = key.uppercased()
        for character in newKey {
                if (character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90) {
                   continue
                }
                else if UInt32(String(character)) != nil {
                   continue
                }
                else {
                  return false
                  }
            
            }
        return true

    }
    
    func isChar (_ value: Character) -> Bool {
        
        if value.unicodeScalars.first!.value >= 65 && value.unicodeScalars.first!.value <= 90 {
            
            return true
        }
        
        return false
    }
    
}

