//
//  CLDConfigurationTests.swift
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

class CLDConfigurationTests: BaseTestCase {
    
    var sut : CLDConfiguration!
    
    // MARK: - setup and teardown
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - LongEncryption
    func test_initLongEncryption_true_shouldStoreValue() {
        
        // Given
        let input = true
        
        // When
        sut = CLDConfiguration(cloudName: "", longEncryption: input)
        
        // Then
        XCTAssertTrue(sut.longEncryption, "Init with longEncryption = true, should be stored in property")
    }
    func test_initLongEncryption_default_shouldStoreFalseValue() {
       
        // When
        sut = CLDConfiguration(cloudName: "")
        
        // Then
        XCTAssertFalse(sut.longEncryption, "Init without longEncryption should store the default false value")
    }
    func test_initLongEncryption_optionsString_shouldStoreValue() {
        
        // Given
        let keyCloudName        = CLDConfiguration.ConfigParam.CloudName.rawValue
        let inputCloudName      = "foo" as AnyObject
        let keyLongEncryption   = CLDConfiguration.ConfigParam.longEncryption.rawValue
        let inputLongEncryption = "true" as AnyObject
        
        // When
        sut = CLDConfiguration(options: [keyCloudName: inputCloudName, keyLongEncryption: inputLongEncryption])
        
        // Then
        XCTAssertTrue(sut.longEncryption, "Init with options with longEncryption = true, should be stored in property")
    }
    func test_initLongEncryption_optionsBool_shouldStoreValue() {
        
        // Given
        let keyCloudName        = CLDConfiguration.ConfigParam.CloudName.rawValue
        let inputCloudName      = "foo" as AnyObject
        let keyLongEncryption   = CLDConfiguration.ConfigParam.longEncryption.rawValue
        let inputLongEncryption = true as AnyObject
        
        // When
        sut = CLDConfiguration(options: [keyCloudName: inputCloudName, keyLongEncryption: inputLongEncryption])
        
        // Then
        XCTAssertTrue(sut.longEncryption, "Init with options with longEncryption = true, should be stored in property")
    }
    func test_initLongEncryption_cloudinaryUrl_shouldStoreValue() {
        
        // Given
        let longEncryptionQuery = ("?\(CLDConfiguration.ConfigParam.longEncryption.description)=true")
        let testedUrl           = "cloudinary://123456789012345:ALKJdjklLJAjhkKJ45hBK92baj3"
        let fullUrl             = testedUrl + longEncryptionQuery
        
        // When
        sut = CLDConfiguration(cloudinaryUrl: fullUrl)

        
        // Then
        XCTAssertTrue(sut.longEncryption, "Init with cloudinaryUrl with valid longEncryption = true, should be stored in property")
    }
}
