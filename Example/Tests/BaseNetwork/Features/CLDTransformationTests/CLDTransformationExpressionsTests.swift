//
//  CLDTransformationExpressionsTests.swift
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

class CLDTransformationExpressionsTests: BaseTestCase {
     
    var sut : CLDTransformation!
    
    // MARK: - setup and teardown
    override func setUp() {
        super.setUp()
        sut = CLDTransformation.init()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    // MARK: - test set expression using get property
    func test_setWidthExpression_emptyInputParamaters_shouldNotStoreNewVariable() {
        
        // Given
        let input       = String()
        let expression  = CLDExpression.init(value: input)
        
        // When
        sut.setWidth(expression)
        
        let actualResult = sut.width!
        
        // Then
        XCTAssertTrue(actualResult.isEmpty, "Empty expression should not be stored in params")
    }
    
    func test_setWidthExpression_inputExpression_shouldStoreNewValue() {
        
        // Given
        let input       = "initialHeight * 2"
        let expression  = CLDExpression.init(value: input)
        
        let expectedResult = "ih_mul_2"
        
        // When
        sut.setWidth(expression)
        
        let actualResult = sut.width!
        
        // Then
        XCTAssertFalse(actualResult.isEmpty, "width should stored new value")
        XCTAssertEqual(actualResult, expectedResult, "Calling get width should return its value")
    }
    
    func test_setHeightExpression_emptyInputParamaters_shouldNotStoreNewVariable() {
        
        // Given
        let input       = String()
        let expression  = CLDExpression.init(value: input)
        
        // When
        sut.setHeight(expression)
        
        let actualResult = sut.height!
        
        // Then
        XCTAssertTrue(actualResult.isEmpty, "Empty expression should not be stored in params")
    }
    
    func test_setHeightExpression_inputExpression_shouldStoreNewValue() {
        
        // Given
        let input       = "initialHeight * 2"
        let expression  = CLDExpression.init(value: input)
        
        let expectedResult = "ih_mul_2"
        
        // When
        sut.setHeight(expression)
        
        let actualResult = sut.height!
        
        // Then
        XCTAssertFalse(actualResult.isEmpty, "x should stored new value")
        XCTAssertEqual(actualResult, expectedResult, "Calling get height should return its value")
    }
    
    
    func test_setXExpression_emptyInputParamaters_shouldNotStoreNewVariable() {
        
        // Given
        let input       = String()
        let expression  = CLDExpression.init(value: input)
        
        // When
        sut.setX(expression)
        
        let actualResult = sut.x!
        
        // Then
        XCTAssertTrue(actualResult.isEmpty, "Empty expression should not be stored in params")
    }
    
    func test_setXExpression_inputExpression_shouldStoreNewValue() {
        
        // Given
        let input       = "initialHeight * 2"
        let expression  = CLDExpression.init(value: input)
        
        let expectedResult = "ih_mul_2"
        
        // When
        sut.setX(expression)
        
        let actualResult = sut.x!
        
        // Then
        XCTAssertFalse(actualResult.isEmpty, "x should stored new value")
        XCTAssertEqual(actualResult, expectedResult, "Calling get x should return its value")
    }
    
    func test_setYExpression_emptyInputParamaters_shouldNotStoreNewVariable() {
        
        // Given
        let input       = String()
        let expression  = CLDExpression.init(value: input)
        
        // When
        sut.setY(expression)
        
        let actualResult = sut.y!
        
        // Then
        XCTAssertTrue(actualResult.isEmpty, "Empty expression should not be stored in params")
    }
    
    func test_setYExpression_inputExpression_shouldStoreNewValue() {
        
        // Given
        let input       = "initialHeight * 2"
        let expression  = CLDExpression.init(value: input)
        
        let expectedResult = "ih_mul_2"
        
        // When
        sut.setY(expression)
        
        let actualResult = sut.y!
        
        // Then
        XCTAssertFalse(actualResult.isEmpty, "y should stored new value")
        XCTAssertEqual(actualResult, expectedResult, "Calling get y should return its value")
    }
    
    func test_setRadiusExpression_emptyInputParamaters_shouldNotStoreNewVariable() {
        
        // Given
        let input       = String()
        let expression  = CLDExpression.init(value: input)
        
        // When
        sut.setRadius(expression)
        
        let actualResult = sut.radius!
        
        // Then
        XCTAssertTrue(actualResult.isEmpty, "Empty expression should not be stored in params")
    }
    
    func test_setRadiusExpression_inputExpression_shouldStoreNewValue() {
        
        // Given
        let input       = "initialHeight * 2"
        let expression  = CLDExpression.init(value: input)
        
        let expectedResult = "ih_mul_2"
        
        // When
        sut.setRadius(expression)
        
        let actualResult = sut.radius!
        
        // Then
        XCTAssertFalse(actualResult.isEmpty, "y should stored new value")
        XCTAssertEqual(actualResult, expectedResult, "Calling get y should return its value")
    }
    
    // MARK: - test asString() on empty expression
    
    func test_asString_expressionWidthWithEmptyInputParamaters_shouldReturnEmptyString() {
        
        // Given
        let value       = String()
        let expression  = CLDExpression.init(value: value)
        
        // When
        sut.setWidth(expression)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertNil(actualResult, "Empty CLDExpression should not be stored in params")
    }
    
    func test_asString_expressionHeightWithEmptyInputParamaters_shouldReturnEmptyString() {
        
        // Given
        let value       = String()
        let expression  = CLDExpression.init(value: value)
        
        // When
        sut.setHeight(expression)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertNil(actualResult, "Empty CLDExpression should not be stored in params")
    }
    
    func test_asString_expressionXWithEmptyInputParamaters_shouldReturnEmptyString() {
        
        // Given
        let value       = String()
        let expression  = CLDExpression.init(value: value)
        
        // When
        sut.setX(expression)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertNil(actualResult, "Empty CLDExpression should not be stored in params")
    }
    
    func test_asString_expressionYWithEmptyInputParamaters_shouldReturnEmptyString() {
        
        // Given
        let value       = String()
        let expression  = CLDExpression.init(value: value)
        
        // When
        sut.setY(expression)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertNil(actualResult, "Empty CLDExpression should not be stored in params")
    }
    
    func test_asString_expressionRadiusWithEmptyInputParamaters_shouldReturnEmptyString() {
        
        // Given
        let value       = String()
        let expression  = CLDExpression.init(value: value)
        
        // When
        sut.setRadius(expression)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertNil(actualResult, "Empty CLDExpression should not be stored in params")
    }
    
    // MARK: - test asString() on expression
    func test_asString_expressionOnWidth_shouldReturnValidString() {
        
        // Given
        let input       = "initialHeight * 2"
        let expression  = CLDExpression.init(value: input)
        
        let expectedResult = "w_ih_mul_2"
        
        // When
        sut.setWidth(expression)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertFalse(actualResult.isEmpty, "asString should stored valid value")
        XCTAssertEqual(actualResult, expectedResult, "Calling get asString should return its value")
    }
    
    func test_asString_expressionOnHeight_shouldReturnValidString() {
        
        // Given
        let input       = "initialHeight * 2"
        let expression  = CLDExpression.init(value: input)
        
        let expectedResult = "h_ih_mul_2"
        
        // When
        sut.setHeight(expression)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertFalse(actualResult.isEmpty, "asString should stored valid value")
        XCTAssertEqual(actualResult, expectedResult, "Calling get asString should return its value")
    }
    
    func test_asString_expressionOnX_shouldReturnValidString() {
        
        // Given
        let input       = "initialHeight * 2"
        let expression  = CLDExpression.init(value: input)
        
        let expectedResult = "x_ih_mul_2"
        
        // When
        sut.setX(expression)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertFalse(actualResult.isEmpty, "asString should stored valid value")
        XCTAssertEqual(actualResult, expectedResult, "Calling get asString should return its value")
    }
    
    func test_asString_expressionOnY_shouldReturnValidString() {
        
        // Given
        let input       = "initialHeight * 2"
        let expression  = CLDExpression.init(value: input)
        
        let expectedResult = "y_ih_mul_2"
        
        // When
        sut.setY(expression)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertFalse(actualResult.isEmpty, "asString should stored valid value")
        XCTAssertEqual(actualResult, expectedResult, "Calling get asString should return its value")
    }
    
    func test_asString_expressionOnRadius_shouldReturnValidString() {
        
        // Given
        let input       = "initialHeight * 2"
        let expression  = CLDExpression.init(value: input)
        
        let expectedResult = "r_ih_mul_2"
        
        // When
        sut.setRadius(expression)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertFalse(actualResult.isEmpty, "asString should stored valid value")
        XCTAssertEqual(actualResult, expectedResult, "Calling get asString should return its value")
    }
    
    func test_asString_extraSpacedExpression_shouldReturnValidString() {
        
        // Given
        let input       = "initialHeight *      2"
        let expression  = CLDExpression.init(value: input)
        
        let expectedResult = "r_ih_mul_2"
        
        // When
        sut.setRadius(expression)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertFalse(actualResult.isEmpty, "asString should stored valid value")
        XCTAssertEqual(actualResult, expectedResult, "Calling asString should remove extra spaces")
    }
    
    func test_asString_expressionOnTwoProperties_shouldReturnValidString() {
        
        // Given
        let widthInput          = "initialHeight * 2"
        let widthExpression     = CLDExpression.init(value: widthInput)
        let radiusInput         = "initialWidth * 2"
        let radiusExpression    = CLDExpression.init(value: radiusInput)
        
        let expectedResult = "r_iw_mul_2,w_ih_mul_2"
        
        // When
        sut.setRadius(radiusExpression)
        sut.setWidth(widthExpression)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertFalse(actualResult.isEmpty, "asString should stored valid value")
        XCTAssertEqual(actualResult, expectedResult, "Calling get asString should return its value")
    }
    
    func test_complexVariablesAtExpressionStart_shouldRetainNames() {
        
        // Given
        let variable       = CLDVariable(name: "$width", value: 10)
        let expectedResult = "$width_10/w_$width_add_10_add_w"
        
        // When
        sut.setVariable(variable)
        sut.chain()
        sut.setWidth("$width + 10 + width")
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertFalse(actualResult!.isEmpty, "asString should stored valid value")
        XCTAssertEqual(actualResult!, expectedResult, "Calling get asString should return its value")
    }
    func test_complexVariablesAtExpressionEnd_shouldRetainNames() {
        
        // Given
        let variable       = CLDVariable(name: "$width", value: 10)
        let expectedResult = "$width_10/w_w_add_10_add_$width"
        
        // When
        sut.setVariable(variable)
        sut.chain()
        sut.setWidth("width + 10 + $width")
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertFalse(actualResult!.isEmpty, "asString should stored valid value")
        XCTAssertEqual(actualResult!, expectedResult, "Calling get asString should return its value")
    }
    
    // MARK: - chained conditions
    func test_chainedConditions_then_shouldReturnValidString() {
        
        // Given
        let expectedResult = "if_w_gt_200,c_scale,w_100"
        
        // When
        sut.ifCondition().width().greater(then: 200).then().setCrop(.scale).setWidth(100)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "chained conditions should create the expected result")
    }

}

/*
 .NET code
 
 var transformation = new Transformation().IfCondition().AspectRatio("gt", "3:4").Then().Width(100).Crop("scale");
 Assert.AreEqual("if_ar_gt_3:4,c_scale,w_100", transformation.ToString(), "passing an operator and a value adds a condition");

 */
