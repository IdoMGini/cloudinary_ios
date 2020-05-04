//
//  CLDExpressionTests.swift
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

class CLDExpressionTests: BaseTestCase {
    
    var sut : CLDExpression!
    
    // MARK: - Setup and Teardown
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - test initilization methods - empty
    func test_init_emptyInputParamaters_shouldStoreEmptyProperties() {
        
        // Given
        let name = String()
        
        // When
        sut = CLDExpression.init()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil currentKey  property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil currentValue property")
        XCTAssertEqual(sut.currentKey, name, "Name property should be equal to name")
        XCTAssertEqual(sut.currentValue, String(), "Initilized object should contain an empty string as currentValue property")
    }
    
    // MARK: - test initilization methods - value
    func test_init_emptyNameParamater_shouldStoreEmptyNameProperty() {
        
        // Given
        let name  = String()
        let value = "alue"
        
        // When
        sut = CLDExpression.init(value: "\(name) \(value)")
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil currentKey  property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil currentValue property")
        XCTAssertEqual(sut.currentValue, value, "Initilized object should contain an empty string as value property")
    }
    
    func test_init_validStringParamatersAndNoNamePrefix_shouldStoreValidProperties() {
        
        // Given
        let name  = "name"
        let value = "alue"
        
        // When
        sut = CLDExpression.init(value: "\(name) \(value)")
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, name, "currentKey should be equal to name")
        XCTAssertEqual(sut.currentValue, value, "Initilized object should contain a string as value property")
    }
    
    func test_init_validStringParamaters_shouldStoreValidProperties() {
        
        // Given
        let name  = "w"
        let value = "* 2"
        let valueResult = "*_2"
        
        // When
        sut = CLDExpression.init(value: "\(name) \(value)")
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil name  property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, name, "currentKey should be equal to name")
        XCTAssertEqual(sut.currentValue, valueResult, "Initilized object should contain a string as valueResult property")
    }
    
    
    // MARK: - test class methods
    func test_width_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "w"
        
        // When
        sut = CLDExpression.width()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    func test_height_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "h"
        
        // When
        sut = CLDExpression.height()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    func test_initialWidth_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "iw"
        
        // When
        sut = CLDExpression.initialWidth()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    func test_initialHeight_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "ih"
        
        // When
        sut = CLDExpression.initialHeight()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    func test_aspectRatio_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "ar"
        
        // When
        sut = CLDExpression.aspectRatio()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    func test_initialAspectRatio_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "iar"
        
        // When
        sut = CLDExpression.initialAspectRatio()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    func test_pageCount_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "pc"
        
        // When
        sut = CLDExpression.pageCount()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    func test_faceCount_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "fc"
        
        // When
        sut = CLDExpression.faceCount()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    func test_tags_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "tags"
        
        // When
        sut = CLDExpression.tags()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    func test_pageXOffset_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "px"
        
        // When
        sut = CLDExpression.pageXOffset()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    func test_pageYOffset_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "py"
        
        // When
        sut = CLDExpression.pageYOffset()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    func test_illustrationScore_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "ils"
        
        // When
        sut = CLDExpression.illustrationScore()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    func test_currentPageIndex_shouldStoreValidKey() {
        
        // Given
        let expectedResult = "cp"
        
        // When
        sut = CLDExpression.currentPageIndex()
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentKey, expectedResult, "currentKey should be equal to expectedResult")
    }
    
    // MARK: - test instance method
    
    func test_addInt_shouldStoreValidFirstValue() {
        
        // Given
        let value = 20
        let expectedValueResult = "+_20"
        // When
        
        sut = CLDExpression.width().add(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_addInt_shouldAppendValidValue() {
        
        // Given
        let name = "height"
        let initialValue = "width"
        let value = 20
        
        let expectedValueResult = "width_+_20"
        
        // When
        sut = CLDExpression.init(value: "\(name) \(initialValue)").add(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_addFloat_shouldStoreValidFirstValue() {
        
        // Given
        let value = CGFloat(30.3)
        let expectedValueResult = "+_30.3"
        // When
        
        sut = CLDExpression.width().add(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_addFloat_shouldAppendValidValue() {
        
        // Given
        let name = "height"
        let initialValue = "width"
        let value = CGFloat(30.3)
        
        let expectedValueResult = "width_+_30.3"
        
        // When
        sut = CLDExpression.init(value: "\(name) \(initialValue)").add(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_subtractInt_shouldStoreValidFirstValue() {
        
        // Given
        let value = 20
        let expectedValueResult = "-_20"
        // When
        
        sut = CLDExpression.width().subtract(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_subtractInt_shouldAppendValidValue() {
        
        // Given
        let name = "height"
        let initialValue = "width"
        let value = 20
        
        let expectedValueResult = "width_-_20"
        
        // When
        sut = CLDExpression.init(value: "\(name) \(initialValue)").subtract(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_subtractFloat_shouldStoreValidFirstValue() {
        
        // Given
        let value = CGFloat(30.3)
        let expectedValueResult = "-_30.3"
        // When
        
        sut = CLDExpression.width().subtract(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_subtractFloat_shouldAppendValidValue() {
        
        // Given
        let name = "height"
        let initialValue = "width"
        let value = CGFloat(30.3)
        
        let expectedValueResult = "width_-_30.3"
        
        // When
        sut = CLDExpression.init(value: "\(name) \(initialValue)").subtract(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_multipleInt_shouldStoreValidFirstValue() {
        
        // Given
        let value = 20
        let expectedValueResult = "*_20"
        // When
        
        sut = CLDExpression.width().multiple(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_multipleInt_shouldAppendValidValue() {
        
        // Given
        let name = "height"
        let initialValue = "width"
        let value = 20
        
        let expectedValueResult = "width_*_20"
        
        // When
        sut = CLDExpression.init(value: "\(name) \(initialValue)").multiple(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_multipleFloat_shouldStoreValidFirstValue() {
        
        // Given
        let value = CGFloat(30.3)
        let expectedValueResult = "*_30.3"
        // When
        
        sut = CLDExpression.width().multiple(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_multipleFloat_shouldAppendValidValue() {
        
        // Given
        let name = "height"
        let initialValue = "width"
        let value = CGFloat(30.3)
        
        let expectedValueResult = "width_*_30.3"
        
        // When
        sut = CLDExpression.init(value: "\(name) \(initialValue)").multiple(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_divideInt_shouldStoreValidFirstValue() {
        
        // Given
        let value = 20
        let expectedValueResult = "/_20"
        // When
        
        sut = CLDExpression.width().divide(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_divideInt_shouldAppendValidValue() {
        
        // Given
        let name = "height"
        let initialValue = "width"
        let value = 20
        
        let expectedValueResult = "width_/_20"
        
        // When
        sut = CLDExpression.init(value: "\(name) \(initialValue)").divide(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_divideFloat_shouldStoreValidFirstValue() {
        
        // Given
        let value = CGFloat(30.3)
        let expectedValueResult = "/_30.3"
        // When
        
        sut = CLDExpression.width().divide(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    func test_divideFloat_shouldAppendValidValue() {
        
        // Given
        let name = "height"
        let initialValue = "width"
        let value = CGFloat(30.3)
        
        let expectedValueResult = "width_/_30.3"
        
        // When
        sut = CLDExpression.init(value: "\(name) \(initialValue)").divide(by: value)
        
        // Then
        XCTAssertNotNil(sut.currentKey, "Initilized object should contain a none nil key property")
        XCTAssertNotNil(sut.currentValue, "Initilized object should contain a none nil value property")
        
        XCTAssertEqual(sut.currentValue, expectedValueResult, "currentValue should be equal to expectedValueResult")
    }
    
    // MARK: - test asString()
    func test_asString_emptyInputParamaters_shouldReturnEmptyString() {
        
        // Given
        let value = String()
        let expectedResult = String()
        
        // When
        sut = CLDExpression.init(value: value)
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString on an empty CLDVariable, should return an empty string")
    }
    
    func test_asString_validParamaters_shouldReturnValidString() {
        
        // Given
        let name            = "initialWidth"
        let value           = "* 200 / faceCount"
        let expectedResult  = "iw_mul_200_div_fc"
        
        // When
        sut = CLDExpression.init(value: "\(name) \(value)")
        
        let actualResult = sut.asString()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString on a CLDVariable, should return a string")
    }
    
    // MARK: - test asParams()
    func test_asParams_emptyInputParamaters_shouldReturnEmptyString() {
        
        // Given
        let value = String()
        let expectedResult = [String:String]()
        
        // When
        sut = CLDExpression.init(value: value)
        
        let actualResult = sut.asParams()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asParams, should build a paramater representation")
    }
    
    func test_asParams_validParamaters_shouldReturnValidString() {
        
        // Given
        let name            = "initialWidth"
        let value           = "* 200 / faceCount"
        let expectedResult  = ["iw":"mul_200_div_fc"]
        
        // When
        sut = CLDExpression.init(value: "\(name) \(value)")
        
        let actualResult = sut.asParams()
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asParams, should build a paramater representation")
    }
}
