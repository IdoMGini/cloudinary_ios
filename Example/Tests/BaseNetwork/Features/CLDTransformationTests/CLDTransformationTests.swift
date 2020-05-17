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
    
    // MARK: - setup and teardown
    override func setUp() {
        super.setUp()
        sut = CLDTransformation.init()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - setHeight
    func test_setHeight_stringValue_shouldReturnValidString() {
        
        // Given
        let input = "w + 200"
        
        let expectedResult = "h_w_add_200"
        
        // When
        sut.setHeight(input)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString should return the expected result")
    }
    
    // MARK: - setX
    func test_setX_stringValue_shouldReturnValidString() {
        
        // Given
        let input = "w + 200"
        
        let expectedResult = "x_w_add_200"
        
        // When
        sut.setX(input)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString should return the expected result")
    }
    
    // MARK: - setY
    func test_setY_stringValue_shouldReturnValidString() {
        
        // Given
        let input = "w + 200"
        
        let expectedResult = "y_w_add_200"
        
        // When
        sut.setY(input)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString should return the expected result")
    }
    
    // MARK: - setRadius
    func test_setRadius_stringValue_shouldReturnValidString() {
        
        // Given
        let input = "w + 200"
        
        let expectedResult = "r_w_add_200"
        
        // When
        sut.setRadius(input)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString should return the expected result")
    }
    
    // MARK: - setRawTransformation
    func test_setRawTransformation_shouldReturnValidString() {
        
        // Given
        let input = "r_w_add_200"
        
        let expectedResult = "r_w_add_200"
        
        // When
        sut.setRawTransformation(input)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString should return the expected result")
    }
    func test_setRawTransformation_multiProperties_shouldOrderTransformation() {
        
        // Given
        let input = "r_w_add_200"
        
        let expectedResult = "c_fit,w_100,r_w_add_200"
        
        // When
        sut.setCrop(.fit).setRawTransformation(input).setWidth(100)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString should return the expected result")
    }
    func test_setRawTransformation_ifEnd_shouldOrderTransformation() {
        
        // Given
        let input = "r_w_add_200"
        
        let expectedResult = "if_w_gt_100/c_fit,w_100,r_w_add_200/if_end"
        
        // When
        sut.ifCondition().width(">", 100).then().setCrop(.fit).setRawTransformation(input).setWidth(100).endIf()
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString should return the expected result")
    }
    
    // MARK: - set helper methods
    func test_setStartOffsetAndEndOffset_shouldReturnValidString() {
        
        // Given
        let expectedResult = "eo_20.2,so_30.3"
        
        // When
        sut.setStartOffsetAndEndOffset(startSeconds: 30.3, endSeconds: 20.2)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString should return the expected result")
    }
    func test_setStartOffsetAndEndOffset_percent_shouldReturnValidString() {
        
        // Given
        let expectedResult = "eo_30p,so_20p"
        
        // When
        sut.setStartOffsetAndEndOffset(startPercent: 20, endPercent: 30)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString should return the expected result")
    }
    func test_setTopLeftPoint_shouldReturnValidString() {
        
        // Given
        let point = CGPoint.init(x: 20.2, y: 30.3)
        let expectedResult = "x_20.2,y_30.3"
        
        // When
        sut.setTopLeftPoint(point)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString should return the expected result")
    }
}
