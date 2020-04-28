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
    
    var sut : CLDVariable!
    
    // MARK: - Setup and Teardown
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - test initilization methods - empty
    func test_empty_init_works_correctlly() {
        
        // Given
        let name = String()
        
        // When
        sut = CLDVariable.init()
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "Name property should contain a valid prefix")
        XCTAssertEqual(sut.value, String(), "Initilized object should contain an empty string as value property")
        XCTAssertNotEqual(sut.name , name, "Name property should contain \"\(CLDVariable.variableNamePrefix)\" prefix")
    }
    
    // MARK: - test initilization methods - value
    func test_init_with_string_paramaters_works_correctlly_empty_name_paramater() {
        
        // Given
        let name  = String()
        let value = "alue"
        
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
        
        // When
        sut = CLDVariable.init(name: name, value: value)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "name property should have a valid prefix")
        XCTAssertEqual(sut.value, String(value), "Initilized object should contain an empty string as value property")
    }
    
    // MARK: - test initilization methods - values
    func test_init_with_valuesArray_works_correctlly_empty_name_paramater() {
        
        // Given
        let name   =  String()
        let values = [String]()
        var sut : CLDVariable
        
        // When
        sut = CLDVariable.init(name: name, values: values)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name, CLDVariable.variableNamePrefix + name, "name property should have a valid prefix")
        XCTAssertEqual(sut.value, String(), "Initilized object should contain an empty string as value property")
    }
    func test_init_with_valuesArray_works_correctlly_paramater() {
        
        // Given
        let name   = "name"
        let values = [String]()
        
        // When
        sut = CLDVariable.init(name: name, values: values)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "Name property should have a valid prefix")
        XCTAssertEqual(sut.value, String(), "Initilized object should contain an empty string as value property")
    }
    func test_init_with_valuesArray_with_content_works_correctlly_single_param() {
        
        // Given
        let name   = "foo"
        let values = ["my"]
        let expectedResult = "!my!"
        
        // When
        sut = CLDVariable.init(name: name, values: values)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "Name property should have a valid prefix")
        XCTAssertEqual(sut.value, expectedResult, "Initilized object should contain an encoded string as value property")
    }
    func test_init_with_valuesArray_with_content_works_correctlly_two_param() {
        
        // Given
        let name   = "foo"
        let values = ["my","str"]
        let expectedResult = "!my:str!"
        
        // When
        sut = CLDVariable.init(name: name, values: values)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "Name property should have a valid prefix")
        XCTAssertEqual(sut.value, expectedResult, "Initilized object should contain an encoded string as value property")
    }
    func test_init_with_valuesArray_with_content_works_correctlly_three_param() {
        
        // Given
        let name   = "foo"
        let values = ["my","str","ing"]
        let expectedResult = "!my:str:ing!"
        
        // When
        sut = CLDVariable.init(name: name, values: values)
        
        // Then
        XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.name , CLDVariable.variableNamePrefix + name, "Name property should have a valid prefix")
        XCTAssertEqual(sut.value, expectedResult, "Initilized object should contain an encoded string as value property")
    }
    
    // MARK: - test asString()
    func test_empty_string_conversion_works_correctlly() {
        
        // Given
        let name  = String()
        let value = String()
        let expectedResult = String()
        
        // When
        sut = CLDVariable.init(name: name, value: value)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString on an empty CLDVariable, should return an empty string")
    }
    func test_string_conversion_works_correctlly() {
        
        // Given
        let name  = "$foo"
        let value = "bar"
        let expectedResult = "$foo_bar"
        
        // When
        sut = CLDVariable.init(name: name, value: value)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString on an empty CLDVariable, should return an empty string")
    }
    
    // MARK: - test asParams()
    func test_empty_as_params_conversion_works_correctlly() {
        
        // Given
        let name  = String()
        let value = String()
        let expectedResult = [String:String]()
        
        // When
        sut = CLDVariable.init(name: name, value: value)
        
        let actualResult = sut.asParams()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asParams, should build a paramater representation")
    }
    func test_as_params_conversion_works_correctlly() {
        
        // Given
        let name   = "foo"
        let values = ["my","str","ing"]
        let expectedResult = ["$foo":"!my:str:ing!"]
        
        // When
        sut = CLDVariable.init(name: name, values: values)
        
        let actualResult = sut.asParams()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asParams, should build a paramater representation")
    }
}
