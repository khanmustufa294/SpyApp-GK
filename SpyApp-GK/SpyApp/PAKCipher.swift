//
//  PAKCipher.swift
//  SpyApp
//
//  Created by Ghulam Khan on 9/13/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation



struct PAKCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String {
        
        var newText = plaintext
        // dictionary of chars to substitute
        var startAt: UInt32 = 97
        
        if  (!isOnlyAlpha(plaintext)) {
            
            return "please enter valid text for key"
        }
        
        if  (!isOnlyAlpha(secret)) {
            
            return "please enter valid text for secret"
        }
        
        if secret.count > 26 {
            
            return "secret cannot be more than 26 chars [A-Z]"
        }
        
        // replace all a-z chars with secret chars
        
    
        
        for character in secret {
            let toReplaceWith = String (character)
            newText = newText.replacingOccurrences(of: String(UnicodeScalar(UInt8(startAt))), with: toReplaceWith, options: NSString.CompareOptions.literal, range: nil)
            
            startAt = startAt + 1
        }
        return newText
    }
    
    func decode(_ plaintext: String, secret: String) -> String {
        
        var newText = plaintext
        var startAt: UInt32 = 97
        
        // replace all a-z chars with secret chars
        
        if  (!isOnlyAlpha(plaintext)) {
            
            return "please enter valid text for key"
        }
        
        if  (!isOnlyAlpha(secret)) {
            
            return "please enter valid text for secret"
        }
        
        for character in secret {
            let toReplaceWith = String (character)
            newText = newText.replacingOccurrences(of: toReplaceWith, with: String(UnicodeScalar(UInt8(startAt))), options: NSString.CompareOptions.literal, range: nil)
            startAt = startAt + 1
        }
        return newText
}
    
    func isOnlyAlpha (_ key: String) -> Bool {
        var hasOnlyAlpha = true
        let newKey = key.uppercased()
        for character in newKey {
            if !(character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90) {
                hasOnlyAlpha = false
            }
        }
        return hasOnlyAlpha
    }
}
