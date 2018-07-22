//
//  Tests.swift
//  TestingSampleTests
//
//  Created by Sajad on 7/22/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import XCTest
@testable import TestingWithCISample

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddition() {
        // Arange
        // Nothing to arrange
        let testableCode = TestableCode()
        
        // Act
        // call addition function with two numbers
        
        let sum = testableCode.addnumbers(numberOne: 8, numberTwo: 12)
    
        // Assert
        // check if the result was correct
        XCTAssertEqual(sum, 20, "Addtion of 8 and 12 is not equal to 20")
    }
    
    func testGithubFetch() {
        // Arrange
        // get testable object
        let testableCodeObject = TestableCode()
        // have an expectation
        let expectation = XCTestExpectation(description: "Sources is loaded from github server")
        
        // Act
        // cal asyncronous functions
        testableCodeObject.searchRepoOnGithub(forText: "network", completionHanlder: { (success, items) in
            // assert result
            XCTAssert(success)
            expectation.fulfill()
        })
        
        //wait for expectation
        wait(for: [expectation], timeout: 10)
        
    }
    
    func testGithubSearchResult() {
        //Arrange
        //get testable object
        let testableObject = TestableCode()
        // have an expectation
        let expectation = XCTestExpectation(description: "Source is loaded from github server")
        
        //Act
        // call asyncrounous function
        testableObject.searchRepoOnGithub(forText: "network") { (success, items) in
            expectation.fulfill()
            XCTAssertEqual(items?.count, 30, "Result count against 'network' is not 20")
        }
        
        //wait for expectation
        wait(for: [expectation], timeout: 10)
    }
    
    
    
    func testJsonParsing() {
        // This is an example of a performance test case.
        
        // get testable object
        let testableObject = TestableCode()
        self.measure {
            testableObject.parseSomeHeavyJson()
        }
    }
    
}
