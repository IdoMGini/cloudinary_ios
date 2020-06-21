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
    
    // MARK: - long url signature
    func test_initLongUrlSignature_true_shouldStoreValue() {
        
        // Given
        let input = true
        
        // When
        sut = CLDConfiguration(cloudName: "", longUrlSignature: input)
        
        // Then
        XCTAssertTrue(sut.longUrlSignature, "Init with longUrlSignature = true, should be stored in property")
    }
    func test_initLongUrlSignature_default_shouldStoreFalseValue() {
       
        // When
        sut = CLDConfiguration(cloudName: "")
        
        // Then
        XCTAssertFalse(sut.longUrlSignature, "Init without longUrlSignature should store the default false value")
    }
    func test_initLongUrlSignature_optionsString_shouldStoreValue() {
        
        // Given
        let keyCloudName          = CLDConfiguration.ConfigParam.CloudName.rawValue
        let inputCloudName        = "foo" as AnyObject
        let keyLongUrlSignature   = CLDConfiguration.ConfigParam.LongUrlSignature.rawValue
        let inputLongUrlSignature = "true" as AnyObject
        
        // When
        sut = CLDConfiguration(options: [keyCloudName: inputCloudName, keyLongUrlSignature: inputLongUrlSignature])
        
        // Then
        XCTAssertTrue(sut.longUrlSignature, "Init with options with longUrlSignature = true, should be stored in property")
    }
    func test_initLongUrlSignature_optionsBool_shouldStoreValue() {
        
        // Given
        let keyCloudName          = CLDConfiguration.ConfigParam.CloudName.rawValue
        let inputCloudName        = "foo" as AnyObject
        let keyLongUrlSignature   = CLDConfiguration.ConfigParam.LongUrlSignature.rawValue
        let inputLongUrlSignature = true as AnyObject
        
        // When
        sut = CLDConfiguration(options: [keyCloudName: inputCloudName, keyLongUrlSignature: inputLongUrlSignature])
        
        // Then
        XCTAssertTrue(sut.longUrlSignature, "Init with options with longUrlSignature = true, should be stored in property")
    }
    func test_initLongUrlSignature_cloudinaryUrl_shouldStoreValue() {
        
        // Given
        let longUrlSignatureQuery = ("?\(CLDConfiguration.ConfigParam.LongUrlSignature.description)=true")
        let testedUrl             = "cloudinary://123456789012345:ALKJdjklLJAjhkKJ45hBK92baj3@test"
        let fullUrl               = testedUrl + longUrlSignatureQuery
        
        // When
        sut = CLDConfiguration(cloudinaryUrl: fullUrl)

        
        // Then
        XCTAssertTrue(sut.longUrlSignature, "Init with cloudinaryUrl with valid longUrlSignature = true, should be stored in property")
    }
    
    // MARK: - signature algorithm
    func test_initSignatureAlgorithm_setSha256_shouldStoreValue() {
        
        // Given
        let input = CLDConfiguration.SignatureAlgorithm.sha256
        
        // When
        sut = CLDConfiguration(cloudName: "", signatureAlgorithm: input)
        
        // Then
        XCTAssertEqual(sut.signatureAlgorithm, .sha256, "Init with signatureAlgorithm should store that value")
    }
    func test_initSignatureAlgorithm_default_shouldStoreDefaultValue() {
       
        // When
        sut = CLDConfiguration(cloudName: "")
        
        // Then
        XCTAssertEqual(sut.signatureAlgorithm, .sha1, "Init without signatureAlgorithm should store the default .sha1 value")
    }
    func test_initSignatureAlgorithm_optionsInt_shouldStoreValue() {
        
        // Given
        let keyCloudName            = CLDConfiguration.ConfigParam.CloudName.rawValue
        let inputCloudName          = "foo" as AnyObject
        let keySignatureAlgorithm   = CLDConfiguration.ConfigParam.SignatureAlgorithm.rawValue
        let inputSignatureAlgorithm = 1 as AnyObject
        
        // When
        sut = CLDConfiguration(options: [keyCloudName: inputCloudName, keySignatureAlgorithm: inputSignatureAlgorithm])
        
        // Then
        XCTAssertEqual(sut.signatureAlgorithm, .sha256, "Init with options with signatureAlgorithm should store that value")
    }
    func test_initSignatureAlgorithm_optionsEnum_shouldStoreValue() {
        
        // Given
        let keyCloudName            = CLDConfiguration.ConfigParam.CloudName.rawValue
        let inputCloudName          = "foo" as AnyObject
        let keySignatureAlgorithm   = CLDConfiguration.ConfigParam.SignatureAlgorithm.rawValue
        let inputSignatureAlgorithm = CLDConfiguration.SignatureAlgorithm.sha256 as AnyObject
        
        // When
        sut = CLDConfiguration(options: [keyCloudName: inputCloudName, keySignatureAlgorithm: inputSignatureAlgorithm])
        
        // Then
        XCTAssertEqual(sut.signatureAlgorithm, .sha256, "Init with options with signatureAlgorithm should store that value")
    }
    func test_initSignatureAlgorithm_optionsInvalidEnum_shouldStoreValue() {
        
        // Given
        let keyCloudName            = CLDConfiguration.ConfigParam.CloudName.rawValue
        let inputCloudName          = "foo" as AnyObject
        let keySignatureAlgorithm   = CLDConfiguration.ConfigParam.SignatureAlgorithm.rawValue
        let inputSignatureAlgorithm = 2 as AnyObject
        
        // When
        sut = CLDConfiguration(options: [keyCloudName: inputCloudName, keySignatureAlgorithm: inputSignatureAlgorithm])
        
        // Then
        XCTAssertEqual(sut.signatureAlgorithm, .sha1, "Init with options with invalid signatureAlgorithm should store the default .sha1 value")
    }
    func test_initSignatureAlgorithm_cloudinaryUrl_shouldStoreValue() {
        
        // Given
        let signatureAlgorithmQuery = ("?\(CLDConfiguration.ConfigParam.SignatureAlgorithm.description)=1")
        let testedUrl               = "cloudinary://123456789012345:ALKJdjklLJAjhkKJ45hBK92baj3@test"
        let fullUrl                 = testedUrl + signatureAlgorithmQuery
        
        // When
        sut = CLDConfiguration(cloudinaryUrl: fullUrl)

        // Then
        XCTAssertEqual(sut.signatureAlgorithm, .sha256,"Init with cloudinaryUrl with valid signatureAlgorithm should store that value")
    }
}
