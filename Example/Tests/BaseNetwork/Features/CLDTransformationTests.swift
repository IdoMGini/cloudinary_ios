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
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - test invalid variable using get param
    func test_empty_variable_in_param_works_correctlly() {
        
        // Given
        let variableName   = String()
        let variableValue  = String()
        
        // When
        sut = CLDTransformation.init()
        sut.setVariable(name: variableName, value: variableValue)
        
        let actualResult = sut.getParam(variableName)
        
        // Then
        XCTAssertNil(actualResult, "Empty CLDVariable should not be stored in params")
    }
    func test_empty_variable_value_in_param_works_correctlly() {
        
        // Given
        let variableName   = "$foo"
        let variableValue  = String()
        
        // When
        sut = CLDTransformation.init()
        sut.setVariable(name: variableName, value: variableValue)
        
        let actualResult = sut.getParam(variableName)
        
        // Then
        XCTAssertNil(actualResult, "Empty CLDVariable should not be stored in params")
    }
    
    // MARK: - test set variable using get param
    func test_variable_in_params_works_correctlly() {

        // Given
        let variableName   = "$foo"
        let variableValue  = "bar"
        let expectedResult = "bar"

        // When
        sut = CLDTransformation.init()
        sut.setVariable(name: variableName, value: variableValue)
        
        let actualResult = sut.getParam(variableName)
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling getParam on an CLDTransformation with a valid CLDVariable name as param, should return its value")
    }
    func test_variable_object_in_param_works_correctlly() {

        // Given
        let variableName   = "$foo"
        let variableValue  = "bar"
        let variable = CLDVariable(name: variableName, value: variableValue)
        let expectedResult = "bar"

        // When
        sut = CLDTransformation.init()
        sut.setVariable(variable)
        
        let actualResult = sut.getParam(variableName)
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling getParam on an CLDTransformation with a valid CLDVariable name as param, should return its value")
    }
    func test_variable_array_in_param_works_correctlly() {

        // Given
        let variableName   = "$foo"
        let variableValue  = "bar"
        let variable = CLDVariable(name: variableName, value: variableValue)
        let expectedResult = "bar"

        // When
        sut = CLDTransformation.init()
        sut.setVariable([variable])
        
        let actualResult = sut.getParam(variableName)
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling getParam on an CLDTransformation with a valid CLDVariable name as param, should return its value")
    }
    func test_two_variables_array_in_param_works_correctlly() {

        // Given
        let variableName    = "$foo"
        let variableValue   = "bar"
        let variableName2   = "$foo2"
        let variableValue2  = "bar2"
        let variable        = CLDVariable(name: variableName , value: variableValue)
        let variable2       = CLDVariable(name: variableName2, value: variableValue2)
        let expectedResult  = "bar"
        let expectedResult2 = "bar2"

        // When
        sut = CLDTransformation.init()
        sut.setVariable([variable, variable2])
        
        let actualResult  = sut.getParam(variableName)
        let actualResult2 = sut.getParam(variableName2)
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling getParam on an CLDTransformation with a valid CLDVariable name as param, should return its value")
        XCTAssertEqual(actualResult2, expectedResult2, "Calling getParam on an CLDTransformation with a valid CLDVariable name as param, should return its value")
    }
    
    // MARK: - test asString() on empty variable
    func test_empty_variable_string_conversion_works_correctlly() {
        
        // Given
        let variableName   = String()
        let variableValue  = String()
        let expectedResult = String()
        
        // When
        sut = CLDTransformation.init()
        sut.setVariable(name: variableName, value: variableValue)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Empty CLDVariable should not be stored in params")
    }
    func test_empty_variable_array_string_conversion_works_correctlly() {
        
        // Given
        let variable = CLDVariable.init()
        let expectedResult = String()
        
        // When
        sut = CLDTransformation.init()
        sut.setVariable([variable])
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Empty CLDVariable should not be stored in params")
    }
    
    // MARK: - test asString() on variable
    func test_variable_string_conversion_works_correctlly() {

        // Given
        let variableName   = "foo"
        let variableValue  = "bar"
        let expectedResult = "$foo_bar"

        // When
        sut = CLDTransformation.init()
        sut.setVariable(name: variableName, value: variableValue)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString() on an CLDTransformation with a valid CLDVariable as param, should return the expected string")
    }
    func test_variable_array_string_conversion_works_correctlly() {

        // Given
        let variableName   = "foo"
        let variableValue  = "bar"
        let variable = CLDVariable(name: variableName, value: variableValue)
        let expectedResult = "$foo_bar"

        // When
        sut = CLDTransformation.init()
        sut.setVariable([variable])
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString() on an CLDTransformation with a valid CLDVariable as param, should return the expected string")
    }
    func test_two_variables_array_string_conversion_works_correctlly() {

        // Given
        let variableName   = "foo"
        let variableValue  = "bar"
        let variableName2  = "foo2"
        let variableValue2 = "bar2"
        let variable       = CLDVariable(name: variableName, value: variableValue)
        let variable2      = CLDVariable(name: variableName2, value: variableValue2)
        let expectedResult = "$foo_bar,$foo2_bar2"

        // When
        sut = CLDTransformation.init()
        sut.setVariable([variable, variable2])
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString() on an CLDTransformation with a valid CLDVariable as param, should return the expected string")
    }
    func test_variable_array_and_params_string_conversion_works_correctlly() {

        // Given
        let variableName   = "foo"
        let variableValue  = "bar"
        let variableName2  = "foo2"
        let variableValue2 = "bar2"
        let variable       = CLDVariable(name: variableName, value: variableValue)
        let variable2      = CLDVariable(name: variableName2, value: variableValue2)
        let expectedResult = "$foo_bar,$foo2_bar2,h_12.0,w_11.0"

        // When
        sut = CLDTransformation.init()
        sut.setWidth(11.0)
        sut.setVariable([variable, variable2])
        sut.setHeight(12.0)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString() on an CLDTransformation with a valid CLDVariable as param, should return the expected string - variables first!")
    }
}