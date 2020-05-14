//
//  CLDConditionExpressionHelpersTests.swift
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

@testable import Cloudinary
import Foundation
import XCTest

class CLDConditionExpressionHelpersTests: BaseTestCase {
    
    var sut : CLDConditionExpression!
    
    // MARK: - setup and teardown
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - widthWithOperator
    func test_widthWithOperator_intValue_shouldAppendValidValue() {
        
        // Given
        let stringOperator = "<"
        let value: Int = 100
        
        let expectedValueResult = "w_lt_100"
        
        // When
        sut = CLDConditionExpression().width(stringOperator, value)
        
        // Then
        XCTAssertEqual(sut.asString(), expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_widthWithOperator_floatValue_shouldAppendValidValue() {
        
        // Given
        let stringOperator = ">"
        let value = Float(30.3)
        
        let expectedValueResult = "w_gt_30.3"
        
        // When
        sut = CLDConditionExpression().width(stringOperator, value)
        
        // Then
        XCTAssertEqual(sut.asString(), expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_widthWithOperator_stringValue_shouldAppendValidValue() {
        
        // Given
        let stringOperator = "="
        let value = "30.3"
        
        let expectedValueResult = "w_eq_30.3"
        
        // When
        sut = CLDConditionExpression().width(stringOperator, value)
        
        // Then
        XCTAssertEqual(sut.asString(), expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_widthWithOperator_expressionValue_shouldAppendValidValue() {
        
        // Given
        let stringOperator = "="
        let value = CLDExpression.initialHeight().add(by: 20)
        
        let expectedValueResult = "w_eq_ih_add_20"
        
        // When
        sut = CLDConditionExpression().width(stringOperator, value)
        
        // Then
        XCTAssertEqual(sut.asString(), expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_widthWithOperator_conditionValue_shouldAppendValidValue() {
        
        // Given
        let stringOperator = "="
        let value = CLDConditionExpression.initialHeight().add(by: 20)
        let expectedValueResult = "w_eq_ih_add_20"
        
        // When
        sut = CLDConditionExpression().width(stringOperator, value)
        
        // Then
        XCTAssertEqual(sut.asString(), expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
}
