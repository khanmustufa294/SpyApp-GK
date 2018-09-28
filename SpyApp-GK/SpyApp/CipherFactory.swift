import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "cesar": CeaserCipher(),
        "alphanumcesar" : AlphaNumericCesarCipher(),
        "ROT" : ROT786(),
        "PAKcipher" : PAKCipher()
    ]

    func cipher(for key: String) -> Cipher {
        
        return ciphers[key]!
    }
}
