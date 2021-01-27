//
//  CalculatorManagerTests.swift
//  Calculator appTests
//
//  Created by Desiree on 1/27/21.
//  Copyright © 2021 Desiree. All rights reserved.
//

import XCTest
@testable import Calculator_app

class CalculatorManagerTests: XCTestCase {
    var sut: CalculatorManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CalculatorManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testInit_WhenGivenValues_TakesValues() {
        let calcManager1 = CalculatorManager(operation: .add, firstNumber: 1, secondNumber: 3, performingMath: true)
        
        let calcManager2 = CalculatorManager(operation: .add, firstNumber: 1, secondNumber: 3, performingMath: true)
        
        XCTAssertEqual(calcManager1, calcManager2)
    }

    func testValues_AreInitiallyZero() {
        XCTAssertEqual(sut.firstNumber, 0)
        XCTAssertEqual(sut.secondNumber, 0)
    }
    
    
    func testCalculation_ForAddition() {
        sut.firstNumber = 2
        sut.secondNumber = 5
        sut.operation = .add
        
        XCTAssertEqual(sut.calculate(), "7.0")
    }
    
    func testCalculation_ForSubtraction() {
        sut.firstNumber = 3
        sut.secondNumber = 6
        sut.operation = .subtract
        
        XCTAssertEqual(sut.calculate(), "-3.0")
    }
    
    func testCalculation_ForMultiplication() {
        sut.firstNumber = 4
        sut.secondNumber = 5
        sut.operation = .multiply
        
        XCTAssertEqual(sut.calculate(), "20.0")
    }
    
    func testCalculation_ForDivision() {
        sut.firstNumber = 10
        sut.secondNumber = 5
        sut.operation = .divide
        
        XCTAssertEqual(sut.calculate(), "2.0")
    }
    
    func testCalculation_ForDivisionWithRemainder() {
        sut.firstNumber = 2
        sut.secondNumber = 5
        sut.operation = .divide
        
        XCTAssertEqual(sut.calculate(), "0.4")
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
