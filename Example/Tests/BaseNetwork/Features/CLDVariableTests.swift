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

class CLDVariableTests: BaseTestCase {
    
    // MARK: - Setup and Teardown
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - test initilization methods - empty
    func test_empty_init_works_correctlly() {
        
        // Given
        let name = String()
        var sut : CLDVariable
        
        // When
        sut = CLDVariable.init()
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "name property should have a valid prefix")
        XCTAssertEqual(sut.value, String(), "Initilized object should contain an empty string as value property")
    }
    
    // MARK: - test initilization methods - value
    func test_init_with_string_paramaters_works_correctlly_empty_name_paramater() {
        
        // Given
        let name  = String()
        let value = "alue"
        var sut : CLDVariable
        
        // When
        sut = CLDVariable.init(name: name, value: value)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "name property should have a valid prefix")
        XCTAssertEqual(sut.value, value, "Initilized object should contain an empty string as value property")
    }
    func test_init_with_string_paramaters_works_correctlly() {
        
        // Given
        let name  = "name"
        let value = "alue"
        var sut : CLDVariable
        
        // When
        sut = CLDVariable.init(name: name, value: value)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "name property should have a valid prefix")
        XCTAssertEqual(sut.value, value, "Initilized object should contain an empty string as value property")
    }
    func test_init_with_string_paramaters_with_valid_name_works_correctlly() {
        
        // Given
        let name  = "$foo"
        let value = "alue"
        var sut : CLDVariable
        
        // When
        sut = CLDVariable.init(name: name, value: value)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name , name, "name property should have a valid prefix")
        XCTAssertEqual(sut.value, value, "Initilized object should contain an empty string as value property")
    }
    func test_init_with_int_paramaters_works_correctlly_empty_name_paramater() {
        
        // Given
        let name  = String()
        let value = 4
        var sut : CLDVariable
        
        // When
        sut = CLDVariable.init(name: name, value: value)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "name property should have a valid prefix")
        XCTAssertEqual(sut.value, String(value), "Initilized object should contain an empty string as value property")
        
    }
    func test_init_with_int_paramaters_works_correctlly() {
        
        // Given
        let name  = "name"
        let value = 4
        var sut : CLDVariable
        
        // When
        sut = CLDVariable.init(name: name, value: value)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "name property should have a valid prefix")
        XCTAssertEqual(sut.value, String(value), "Initilized object should contain an empty string as value property")
        
    }
    func test_init_with_double_paramaters_works_correctlly_empty_name_paramater() {
        
        // Given
        let name  = String()
        let value = 3.14
        var sut : CLDVariable
        
        // When
        sut = CLDVariable.init(name: name, value: value)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "name property should have a valid prefix")
        XCTAssertEqual(sut.value, String(value), "Initilized object should contain an empty string as value property")
    }
    func test_init_with_double_paramaters_works_correctlly() {
        
        // Given
        let name  = "name"
        let value = 3.14
        var sut : CLDVariable
        
        // When
        sut = CLDVariable.init(name: name, value: value)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "name property should have a valid prefix")
        XCTAssertEqual(sut.value, String(value), "Initilized object should contain an empty string as value property")
    }
    
    // MARK: - test initilization methods - values
//    func test_init_with_double_paramaters_works_correctlly_empty_name_paramater() {
//        
//        // Given
//        let name   = String()
//        let values = [String]()
//        var sut : CLDVariable
//        
//        // When
//        sut = CLDVariable.init(name: name, values: values)
//        
//        // Then
//        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
//        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
//        
//        XCTAssertEqual(sut.name, CLDVariable.variableNamePrefix + name, "name property should have a valid prefix")
//        XCTAssertEqual(sut.value, [String](), "Initilized object should contain an empty string as value property")
//    }
//    func test_init_with_double_paramaters_works_correctlly() {
//        
//        // Given
//        let name   = "name"
//        let values = [String]()
//        var sut : CLDVariable
//        
//        // When
//        sut = CLDVariable.init(name: name, value: value)
//        
//        // Then
//        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
//        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
//        
//        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "name property should have a valid prefix")
//        XCTAssertEqual(sut.value, String(value), "Initilized object should contain an empty string as value property")
//    }
    
    // MARK: - test asString()
    //    func testGetStringFromStringValueVariable() {
    //
    //        // Given
    //        let expectedResult = "$foo_2"
    //
    //        // When
    //        let variableString = CLDVariable(variableName: "$foo", variableValue: "2")
    //
    //        // Then
    //        XCTAssertEqual(expectedResult, variableString.asString())
    //    }
    //
    //    func testGetStringFromIntValueVariable() {
    //
    //        // Given
    //        let expectedResult = "$foo_2"
    //
    //        // When
    //        let variableInt = CLDVariable(variableName: "$foo", variableValue: 2)
    //
    //        // Then
    //        XCTAssertEqual(expectedResult, variableInt.asString())
    //    }
    //
    //    func testGetStringFromDoubleValueVariable() {
    //
    //        // Given
    //        let expectedResult = "$foo_2.1234"
    //
    //        // When
    //        let variableDouble = CLDVariable(variableName: "$foo", variableValue: 2.1234)
    //
    //        // Then
    //        XCTAssertEqual(expectedResult, variableDouble.asString())
    //    }
    //
    //    func testGetStringFromArrayValueVariable() {
    //
    //        // Given
    //        let expectedResult = "$foo_!my:str:ing!"
    //
    //        // When
    //        let variableArray = CLDVariable(variableName: "$foo", variableValues: ["my", "str", "ing"])
    //
    //        // Then
    //        XCTAssertEqual(expectedResult, variableArray.asString())
    //    }
    //
    //    // MARK: - test asParams()
    //    func testGetParamsFromStringValueVariable() {
    //
    //        // Given
    //        let expectedResult = [CLDVariable.variableParamKey:"$foo_2"]
    //
    //        // When
    //        let variableString = CLDVariable(variableName: "$foo", variableValue: "2")
    //
    //        // Then
    //        XCTAssertEqual(expectedResult, variableString.asParams())
    //    }
    //
    //    func testGetParamsFromIntValueVariable() {
    //
    //        // Given
    //        let expectedResult = [CLDVariable.variableParamKey:"$foo_2"]
    //
    //        // When
    //        let variableInt = CLDVariable(variableName: "$foo", variableValue: 2)
    //
    //        // Then
    //        XCTAssertEqual(expectedResult, variableInt.asParams())
    //    }
    //
    //    func testGetParamsFromDoubleValueVariable() {
    //
    //        // Given
    //        let expectedResult = [CLDVariable.variableParamKey:"$foo_2.1234"]
    //
    //        // When
    //        let variableDouble = CLDVariable(variableName: "$foo", variableValue: 2.1234)
    //
    //        // Then
    //        XCTAssertEqual(expectedResult, variableDouble.asParams())
    //    }
    //
    //    func testGetParamsFromArrayValueVariable() {
    //
    //        // Given
    //        let expectedResult = [CLDVariable.variableParamKey:"$foo_!my:str:ing!"]
    //
    //        // When
    //        let variableArray = CLDVariable(variableName: "$foo", variableValues: ["my", "str", "ing"])
    //
    //        // Then
    //        XCTAssertEqual(expectedResult, variableArray.asParams())
    //    }
    //
    //    // MARK: - test checkVariableName()
    //    func testCheckValidVariableName() {
    //
    //        // Given
    //        let validName = "$foo"
    //
    //        // When
    //        let variableStringWithValidName = CLDVariable(variableName: validName, variableValue: "2")
    //
    //        // Then
    //        XCTAssertTrue(variableStringWithValidName.checkVariableName())
    //    }
    //
    //    func testCheckInvalidVariableName() {
    //
    //        // Given
    //        let invalidName = "@foo"
    //
    //        // When
    //        let variableStringWithInvalidName = CLDVariable(variableName: invalidName, variableValue: "2")
    //
    //        // Then
    //        XCTAssertFalse(variableStringWithInvalidName.checkVariableName())
    //    }
}
