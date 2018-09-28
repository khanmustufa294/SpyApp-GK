//
//  CesarCipherTests.swift
//  SpyAppTests
//
//  Created by Ghulam Khan on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class CesarCipherTests: XCTestCase {
    
    var cipher: CeaserCipher!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cipher = CeaserCipher()
    }
    
    func test_zero() {
    let plaintext = "A"
    let result = cipher.encode(plaintext, secret: "0")
    XCTAssertEqual(plaintext, result)
        
    }
    
    func test_cylic_negative() {
        let plaintext = "A"
        let result = cipher.encode (plaintext, secret: "-1")
        XCTAssertEqual("Z", result)
    }
    
    func test_cyclic_positive () {
        let plaintext = "Z"
        let result = cipher.encode (plaintext, secret: "1")
        XCTAssertEqual("A", result)

    }
    
    func test_isMessageToEncryptValid () {
         let plaintext = "Z1!"
        let result = cipher.encode (plaintext, secret: "1")
        XCTAssertEqual("please enter valid words with alphabets only", result)
    }
    
    func test_isSecretKeyToEncryptValid () {
        let plaintext = "hello"
        let result = cipher.encode (plaintext, secret: "!")
        XCTAssertEqual("enter a valid secret key",result)
    }
    
    func test_isMessageOnlyAlphabet () {
        let plaintext1 = "hello"
        let plaintext2 = "hello1"
        let result1 = cipher.isOnlyAlpha(plaintext1)
        let result2 = cipher.isOnlyAlpha(plaintext2)
        XCTAssertEqual(true,result1)
        XCTAssertEqual(false,result2) 

        
    }
    
    
}
