//
//  CLDTransformationTests.swift
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

class CLDTransformationTests: BaseTestCase {
     
    var sut : CLDTransformation!
    
    // MARK: - Setup and Teardown
    override func setUp() {
        super.setUp()
        sut = CLDTransformation.init()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - test invalid variable using get param
    func test_setVariable_emptyInputParamaters_shouldNotStoreNewVariable() {
        
        // Given
        let variableName  = String()
        let variableValue = String()
        
        // When
        sut.setVariable(name: variableName, value: variableValue)
        
        let actualResult = sut.getParam(variableName)
        
        // Then
        XCTAssertNil(actualResult, "Empty CLDVariable should not be stored in params")
    }
    func test_setVariable_emptyValueParamater_shouldNotStoreNewVariable() {
        
        // Given
        let variableName  = "$foo"
        let variableValue = String()
        
        // When
        sut.setVariable(name: variableName, value: variableValue)
        
        let actualResult = sut.getParam(variableName)
        
        // Then
        XCTAssertNil(actualResult, "Empty CLDVariable should not be stored in params")
    }
    
    // MARK: - test set variable using get param
    func test_setVariable_validParamaters_shouldStoreNewVariable() {
        
        // Given
        let variableName   = "$foo"
        let variableValue  = "bar"
        let expectedResult = "bar"
        
        // When
        sut.setVariable(name: variableName, value: variableValue)
        
        let actualResult = sut.getParam(variableName)
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling getParam on an CLDTransformation with a valid CLDVariable name as param, should return its value")
    }
    func test_setVariable_validVariableObject_shouldStoreNewVariable() {
        
        // Given
        let variableName   = "$foo"
        let variableValue  = "bar"
        let variable       = CLDVariable(name: variableName, value: variableValue)
        let expectedResult = "bar"
        
        // When
        sut.setVariable(variable)
        
        let actualResult = sut.getParam(variableName)
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling getParam on an CLDTransformation with a valid CLDVariable name as param, should return its value")
    }
    func test_setVariable_twoValidVariableObjectsOneLine_shouldStoreNewVariable() {
        
        // Given
        let variableName1   = "$foo"
        let variableValue1  = "bar"
        let variableName2   = "$nurf"
        let variableValue2  = "baz"
        let variable1       = CLDVariable(name: variableName1, value: variableValue1)
        let variable2       = CLDVariable(name: variableName2, value: variableValue2)
        let expectedResult1 = "bar"
        let expectedResult2 = "baz"
        
        
        // When
        sut.setVariable(variable1).setVariable(variable2)
        
        let actualResult1 = sut.getParam(variableName1)
        let actualResult2 = sut.getParam(variableName2)
        
        // Then
        XCTAssertEqual(actualResult1, expectedResult1, "Calling getParam on an CLDTransformation with a valid CLDVariable name as param, should return its value")
        XCTAssertEqual(actualResult2, expectedResult2, "Calling getParam on an CLDTransformation with a valid CLDVariable name as param, should return its value")
    }
    func test_setVariables_validVariablesArray_shouldStoreNewVariable() {
        
        // Given
        let variableName   = "$foo"
        let variableValue  = "bar"
        let variable       = CLDVariable(name: variableName, value: variableValue)
        let expectedResult = "$foo_bar"
        
        // When
        sut.setVariables([variable])
        
        let actualResult = sut.getParam(CLDTransformation.TransformationParam.VARIABLES.rawValue)
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling getParam on an CLDTransformation with a TransformationParam.VARIABLES.rawValue as param, should return its value")
    }
    func test_setVariables_twoValidVariablesArray_shouldStoreNewVariable() {
        
        // Given
        let variableName    = "$foo"
        let variableValue   = "bar"
        let variableName2   = "$nurf"
        let variableValue2  = "baz"
        let variable        = CLDVariable(name: variableName , value: variableValue)
        let variable2       = CLDVariable(name: variableName2, value: variableValue2)
        let expectedResult  = "$foo_bar,$nurf_baz"
        
        // When
        sut.setVariables([variable, variable2])
        
        let actualResult  = sut.getParam(CLDTransformation.TransformationParam.VARIABLES.rawValue)
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling getParam on an CLDTransformation with a TransformationParam.VARIABLES.rawValue as param, should return its value")
    }
    
    // MARK: - test asString() on empty variable
    func test_asString_variableWithEmptyInputParamaters_shouldReturnEmptyString() {
        
        // Given
        let variableName   = String()
        let variableValue  = String()
        let expectedResult = String()
        
        // When
        sut.setVariable(name: variableName, value: variableValue)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Empty CLDVariable should not be stored in params")
    }
    func test_asString_variablesArrayWithEmptyInputParamaters_shouldReturnEmptyString() {
        
        // Given
        let variable = CLDVariable.init()
        let expectedResult: String? = nil
        
        // When
        sut.setVariables([variable])
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Empty CLDVariable should not be stored in params")
    }
    
    // MARK: - test asString() on variable
    func test_asString_validVariable_shouldReturnValidString() {
        
        // Given
        let variableName   = "foo"
        let variableValue  = "bar"
        let expectedResult = "$foo_bar"
        
        // When
        sut.setVariable(name: variableName, value: variableValue)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString() on an CLDTransformation with a valid CLDVariable as param, should return the expected string")
    }
    
    func test_asString_validOneVariableArray_shouldReturnValidString() {
        
        // Given
        let variableName   = "foo"
        let variableValue  = "bar"
        let variable = CLDVariable(name: variableName, value: variableValue)
        let expectedResult = "$foo_bar"
        
        // When
        sut.setVariables([variable])
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString() on an CLDTransformation with a valid CLDVariable as param, should return the expected string")
    }
    
    func test_asString_validTwoVariablesArray_shouldReturnValidString() {
        
        // Given
        let variableName   = "foo"
        let variableValue  = "bar"
        let variableName2  = "foo2"
        let variableValue2 = "bar2"
        let variable       = CLDVariable(name: variableName, value: variableValue)
        let variable2      = CLDVariable(name: variableName2, value: variableValue2)
        let expectedResult = "$foo_bar,$foo2_bar2"
        
        // When
        sut.setVariables([variable, variable2])
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString() on an CLDTransformation with a valid CLDVariable as param, should return the expected string")
    }
    
    func test_asString_validTwoVariablesArray_shouldReturnValidStringOrderedByEntry() {
        
        // Given
        let variableName   = "foo"
        let variableValue  = "bar"
        let variableName2  = "nurf"
        let variableValue2 = "baz"
        let variable       = CLDVariable(name: variableName, value: variableValue)
        let variable2      = CLDVariable(name: variableName2, value: variableValue2)
        let expectedResult = "$nurf_baz,$foo_bar"
        
        // When
        sut.setVariables([variable2, variable])
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString() on an CLDTransformation with a valid CLDVariable as param, should return the expected string")
    }
    
    func test_asString_validTwoVariablesArrayAndParams_shouldReturnValidSortedString() {
        
        // Given
        let variableName   = "foo"
        let variableValue  = "bar"
        let variableName2  = "foo2"
        let variableValue2 = "bar2"
        let variable       = CLDVariable(name: variableName, value: variableValue)
        let variable2      = CLDVariable(name: variableName2, value: variableValue2)
        let expectedResult = "$foo_bar,$foo2_bar2,h_12.0,w_11.0"
        
        // When
        sut.setWidth(11.0)
        sut.setVariables([variable, variable2])
        sut.setHeight(12.0)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString() on an CLDTransformation with a valid CLDVariable as param, should return the expected string - variables first!")
    }
    
    func test_asString_validTwoVariablesArrayAndParams_shouldReturnValidSortedStringVariablesOrderedByEntry() {
        
        // Given
        let variableName1  = "foo1"
        let variableValue1 = "bar1"
        let variableName2  = "foo2"
        let variableValue2 = "bar2"
        let variableName3  = "foo3"
        let variableValue3 = "bar3"
        let variable1      = CLDVariable(name: variableName1, value: variableValue1)
        let variable2      = CLDVariable(name: variableName2, value: variableValue2)
        let variable3      = CLDVariable(name: variableName3, value: variableValue3)
        let expectedResult = "$foo3_bar3,$foo1_bar1,$foo2_bar2,h_12.0,w_11.0"
        
        // When
        sut.setVariable(variable2)
        sut.setWidth(11.0)
        sut.setVariables([variable3, variable1])
        sut.setHeight(12.0)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString() on an CLDTransformation with a valid CLDVariable as param, should return the expected string - variables first!")
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
}
