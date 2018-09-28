import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String
    func decode (_ plaintext: String, secret: String) -> String
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String {
        
        if !plaintext.isEmpty && isOnlyAlpha(plaintext) {
               var encoded = ""
               if Int32(secret) == nil {
                return "enter a valid secret key"
                }
               var shiftBy = Int32(secret)!
            
            print (shiftBy)
            
               if Int32(secret)! <= -26 {
                shiftBy = Int32(secret)! % -26
                }
              if Int32(secret)! >= 26 {
                shiftBy = Int32(secret)! % 26
                }
            let newText = plaintext.uppercased()
            for character in newText {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = Int32(unicode) + shiftBy
            if (shiftedUnicode < 65) {
                let toActuallyShift = 64 - shiftedUnicode
                shiftedUnicode = 90 - toActuallyShift
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
                //print ("ShiftedUnicode < 65: \(shiftedUnicode)")
                continue
            }
            else if (shiftedUnicode > 90) {
                let toActuallyShift = shiftedUnicode - 90
                shiftedUnicode = 64 + toActuallyShift
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
                //print ("ShiftedUnicode > 90: \(shiftedUnicode)")
                continue
            }
            else {
                let shiftedUnicode = Int32(unicode) + shiftBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
                //print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                }
            }
        return encoded
        }
            else {
            return "please enter valid words with alphabets only"
        }
    }
    
    func decode(_ plaintext: String, secret: String) -> String {
        
        print("to be decoded: \(plaintext)")
        
        
        if isOnlyAlpha(plaintext) {
            var encoded = ""
            if Int32(secret) == nil {
                return "enter a valid secret key"
            }
            var shiftBy = Int32(secret)!
            
            if Int32(secret)! <= -26 {
                shiftBy = Int32(secret)! % -26
            }
            if Int32(secret)! >= 26 {
                shiftBy = Int32(secret)! % 26
            }
            let newText = plaintext.uppercased()
            for character in newText {
                let unicode = character.unicodeScalars.first!.value
                var shiftedUnicode = Int32(unicode) - shiftBy
                if (shiftedUnicode < 65) {
                    let toActuallyShift = 64 - shiftedUnicode
                    shiftedUnicode = 90 - toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("ShiftedUnicode < 65: \(shiftedUnicode)")
                    continue
                }
                else if (shiftedUnicode > 90) {
                    let toActuallyShift = shiftedUnicode - 90
                    shiftedUnicode = 64 + toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("ShiftedUnicode > 90: \(shiftedUnicode)")
                    continue
                }
                else {
                    let shiftedUnicode = Int32(unicode) - shiftBy
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                }
            }
            return encoded
        }
        else {
            return "please enter valid words with alphabets only"
        }
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
