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
    
}

class CLDVariables: BaseTestCase {
    
    func testCreatingVariableAndStringGeneration() {
        
        let expectedResult = "$foo_2"

        let variableInt = CLDVariable(variableName: "$foo", variableValue: 2)
        let variableString = CLDVariable(variableName: "$foo", variableValue: "2")
        
        XCTAssertEqual(expectedResult, variableInt.asString())
        XCTAssertEqual(expectedResult, variableString.asString())
    }
    
    func testCreatingVariableWithDoubleAndStringGeneration() {
        
        let expectedResult = "$foo_2.0"

        let variableDouble = CLDVariable(variableName: "$foo", variableValue: 2.0)
        
        XCTAssertEqual(expectedResult, variableDouble.asString())
    }
    
    func testCreatingVariableWithArrayAndStringGeneration() {
        
        let expectedResult = "$foo_!my:str:ing!"

        let variableArray = CLDVariable(variableName: "$foo", variableValues: ["my", "str", "ing"])
        
        XCTAssertEqual(expectedResult, variableArray.asString())
    }
}
