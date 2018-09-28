//
//  ROT786Test.swift
//  SpyAppTests
//
//  Created by Ghulam Khan on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class ROT786Test: XCTestCase {
    
    var cipher:ROT786!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cipher = ROT786()
    }
    
    
    func test_encode () {
        
        let plaintext = "abc"
        
        let result = cipher.encode(plaintext, secret: "13")
        XCTAssertEqual("NOP", result)
    }
    
    
    func test_decode () {
        
        let plaintext = "nop"
        
        let result = cipher.decode(plaintext, secret: "13")
        XCTAssertEqual("ABC", result)
    }
    
    
    
    
}
