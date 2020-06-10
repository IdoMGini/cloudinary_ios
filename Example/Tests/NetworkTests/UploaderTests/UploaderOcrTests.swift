//
//  UploaderOcrTests.swift
//
//  Copyright (c) 2016 Cloudinary (http://cloudinary.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import XCTest
@testable import Cloudinary

class UploaderOcrTests: NetworkBaseTest {

    var allowOCRCalls = false // prevents redundant call to Cloudinary PAID OCR service. to allow OCR service testing - set to true.
    
    // MARK: - upload
    func test_upload_ocr_uploadShouldSucceed() {

        guard allowOCRCalls else { return }
        
        XCTAssertNotNil(cloudinary!.config.apiSecret, "Must set api secret for this test")

        let expectation = self.expectation(description: "Upload should succeed")
        let resource: TestResourceType = .textImage
        let file = resource.url
        var result: CLDUploadResult?
        var error: NSError?

        let params = CLDUploadRequestParams()
        params.setOcr(true)
        cloudinary!.createUploader().signedUpload(url: file, params: params).response({ (resultRes, errorRes) in
            result = resultRes
            error = errorRes
            
            expectation.fulfill()
        })

        waitForExpectations(timeout: timeout, handler: nil)

        XCTAssertNil(error, "error should be nil")
        XCTAssertNotNil(result, "result should not be nil")
        XCTAssertNotNil(result?.info?.ocr, "ocr param should not be nil")
    }
}
