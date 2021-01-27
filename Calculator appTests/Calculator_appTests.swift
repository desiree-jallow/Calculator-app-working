//
//  Calculator_appTests.swift
//  Calculator appTests
//
//  Created by Desiree on 1/27/21.
//  Copyright © 2021 Desiree. All rights reserved.
//

import XCTest
@testable import Calculator_app

class Calculator_appTests: XCTestCase {
    var sut: ViewController!
    var calcManager: CalculatorManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "CalculatorViewController")
        
        sut.loadViewIfNeeded()
        calcManager = CalculatorManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        calcManager = nil
    }
    
    func testAddingValues_ShouldUpdateLabel() {
        calcManager.symbolPressed(number: "2", label: sut.computingLabel)
        
        calcManager.symbolPressed(number: "5", label: sut.computingLabel)
        
        XCTAssertEqual(sut.computingLabel.text, "25")
    }
    
    func testShowOperation_ShouldUpdateLabel() {
        calcManager.showOperation(for: 2, label: sut.computingLabel)
        XCTAssertEqual(sut.computingLabel.text, "-")
        XCTAssertTrue(calcManager.performingMath, "performing math should be true")
    }
    
    func testClearButton_ShouldClearValuesAndUpdateLabel() {
        calcManager.symbolPressed(number: "7", label: sut.computingLabel)
        sut.clearButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(calcManager.firstNumber, 0.0)
        XCTAssertEqual(calcManager.secondNumber, 0.0)
        XCTAssertEqual(sut.computingLabel.text, "0")
    }


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
