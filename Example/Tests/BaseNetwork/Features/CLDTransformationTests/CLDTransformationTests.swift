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
    
    func test_setx_stringValue_shouldReturnValidString() {
        
        // Given
        let input = "w + 200"
        
        let expectedResult = "x_w_add_200"
        
        // When
        sut.setX(input)
        
        let actualResult = sut.asString()!
        
        // Then
        XCTAssertEqual(actualResult, expectedResult, "Calling asString should return the expected result")
    }
}
