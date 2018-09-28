//
//  AlphaNumericTest.swift
//  SpyAppTests
//
//  Created by Ghulam Khan on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class AlphaNumericTest: XCTestCase {
    
    var cipher: AlphaNumericCesarCipher!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.cipher = AlphaNumericCesarCipher()
    }
    
    func test_cylic_negative() {
        let plaintext = "A0"
        let result = cipher.encode (plaintext, secret: "-1")
        XCTAssertEqual("Z9", result)
    }
    
    func test_cyclic_positive () {
        let plaintext = "Z9"
        let result = cipher.encode (plaintext, secret: "1")
        XCTAssertEqual("A0", result)
        
    }
    
    func test_isMessageToEncryptValid () {
        let plaintext = "Z1!"
        let result = cipher.encode (plaintext, secret: "1")
        XCTAssertEqual("Please enter a valid alpha numeric string", result)
    }
    
    func test_isSecretKeyToEncryptValid () {
        let plaintext = "hello"
        let result = cipher.encode (plaintext, secret: "!")
        XCTAssertEqual("Enter a valid shift key",result)
    }
    
    
    
}
