//
//  UploaderMockOcrTests.swift
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

// UploaderMockOcrTests created to reduce server calls to Cloudinary PAID OCR service
class UploaderMockOcrTests: NetworkBaseTest {

    var sut : CLDUploadResult!
    
    // MARK: - setup and teardown
    override func setUp() {
        super.setUp()
        sut = MockResult
    }
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    // MARK: - upload result
    func test_uploadResult_ocrParsing_ShouldParseAsExpected() {

        //Given
        let expectedStatus                       = "complete"
        let expectedLocale                       = "en"
        let expectedTextDescription              = "OCR test image\nSOME FONT\nAnother font\nOne more\nlast one\n"
        let expectedVerticeX                     = CGFloat(89)
        let expectedVerticeY                     = CGFloat(87)
        let expectedFullTextAnnotationText       = "OCR test image\nSOME FONT\nAnother font\nOne more\nlast one\n"
        let expectedPagesWidth                   = 1144
        let expectedPagesHeight                  = 1048
        let expectedLanguageCode                 = "en"
        let expectedConfidence                   = 1
        let expectedBlockType                    = "TEXT"
        let expectedBoundingBoxVerticeX          = CGFloat(241)
        let expectedBoundingBoxVerticeY          = CGFloat(84)
        let expectedParagraphBoundingBoxVerticeX = CGFloat(241)
        let expectedParagraphBoundingBoxVerticeY = CGFloat(84)
        let expectedWordsBoundingBoxVerticeX     = CGFloat(241)
        let expectedWordsBoundingBoxVerticeY     = CGFloat(87)
        let expectedSymbolText                   = "O"
        let expectedSymbolsBoundingBoxVerticeX   = CGFloat(241)
        let expectedSymbolsBoundingBoxVerticeY   = CGFloat(88)
        
        // Then
        XCTAssertNotNil(sut.info?.ocr, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr, "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.status, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.status, expectedStatus, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0], "mock properties should not be nil")
        
        // text annotations
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].textAnnotations!, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].textAnnotations![0], "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].textAnnotations![0].locale, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].textAnnotations![0].locale, expectedLocale, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].textAnnotations![0].textDescription, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].textAnnotations![0].textDescription, expectedTextDescription, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].textAnnotations![0].boundingBlock, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].textAnnotations![0].boundingBlock?.vertices, "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].textAnnotations![0].boundingBlock?.vertices![0], "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].textAnnotations![0].boundingBlock?.vertices![0].x, expectedVerticeX, "value should be equal to expected value")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].textAnnotations![0].boundingBlock?.vertices![0].y, expectedVerticeY, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation, "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.text, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.text, expectedFullTextAnnotationText, "value should be equal to expected value")
        
        // pages
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0], "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].width, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].width, expectedPagesWidth, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].height, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].height, expectedPagesHeight, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].property, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].property, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].property?.detectedLanguages, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].property?.detectedLanguages![0], "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].property?.detectedLanguages![0].languageCode, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].property?.detectedLanguages![0].languageCode, expectedLanguageCode, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].property?.detectedLanguages![0].confidence, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].property?.detectedLanguages![0].confidence, expectedConfidence, "value should be equal to expected value")
        
        // blocks
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0], "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].blockType, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].blockType, expectedBlockType, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].property, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].property?.detectedLanguages, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].property?.detectedLanguages![0], "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].property?.detectedLanguages![0].languageCode, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].property?.detectedLanguages![0].languageCode, expectedLanguageCode, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].property?.detectedLanguages![0].confidence, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].property?.detectedLanguages![0].confidence, expectedConfidence, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].boundingBox, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].boundingBox?.vertices, "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].boundingBox?.vertices![0], "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].boundingBox?.vertices![0].x, expectedBoundingBoxVerticeX, "value should be equal to expected value")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].boundingBox?.vertices![0].y, expectedBoundingBoxVerticeY, "value should be equal to expected value")
        
        // paragraph
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0], "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].property, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].property?.detectedLanguages, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].property?.detectedLanguages![0], "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].property?.detectedLanguages![0].languageCode, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].property?.detectedLanguages![0].languageCode, expectedLanguageCode, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].property?.detectedLanguages![0].confidence, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].property?.detectedLanguages![0].confidence, expectedConfidence, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].boundingBox, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].boundingBox?.vertices, "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].boundingBox?.vertices![0], "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].boundingBox?.vertices![0].x, expectedParagraphBoundingBoxVerticeX, "value should be equal to expected value")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].boundingBox?.vertices![0].y, expectedParagraphBoundingBoxVerticeY, "value should be equal to expected value")
        
        // words
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0], "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0], "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].property, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].property?.detectedLanguages, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].property?.detectedLanguages![0], "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].property?.detectedLanguages![0].languageCode, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].property?.detectedLanguages![0].languageCode, expectedLanguageCode, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].boundingBox, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].boundingBox?.vertices, "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].boundingBox?.vertices![0], "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].boundingBox?.vertices![0].x, expectedWordsBoundingBoxVerticeX, "value should be equal to expected value")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].boundingBox?.vertices![0].y, expectedWordsBoundingBoxVerticeY, "value should be equal to expected value")
       
        // symbols
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0], "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0].text, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0].text, expectedSymbolText , "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0].property, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0].property?.detectedLanguages, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0].property?.detectedLanguages![0], "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0].property?.detectedLanguages![0].languageCode, "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0].property?.detectedLanguages![0].languageCode, expectedLanguageCode, "value should be equal to expected value")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0].boundingBox, "mock properties should not be nil")
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0].boundingBox?.vertices, "mock properties should not be nil")
        
        XCTAssertNotNil(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0].boundingBox?.vertices![0], "mock properties should not be nil")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0].boundingBox?.vertices![0].x, expectedSymbolsBoundingBoxVerticeX, "value should be equal to expected value")
        XCTAssertEqual(sut.info?.ocr?.advOcr?.data![0].fullTextAnnotation?.pages![0].blocks![0].paragraphs![0].words![0].symbols![0].boundingBox?.vertices![0].y, expectedSymbolsBoundingBoxVerticeY, "value should be equal to expected value")
    }
    
    // MARK: - create mock result
    var MockResult : CLDUploadResult? {
        guard let resultDictionary = convertToDictionary(string: jsonStringResult) else { return nil }
        
        return CLDUploadResult(json: resultDictionary)
    }
    
    func convertToDictionary(string: String) -> [String: AnyObject]? {
        if let data = string.data(using: .utf8) {
            return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
        }
        return nil
    }
    
    let jsonStringResult: String = "{\"asset_id\":\"a63b0808cb58d34f1bb074ec7e291cf5\",\"public_id\":\"hplf6ct1tqorpelxnezi\",\"version\":1591790130,\"version_id\":\"de952b0068804f79515f2b7ef80e0046\",\"signature\":\"3c840854853511ea97b46d0bd4672713acec2e48\",\"width\":1144,\"height\":1048,\"format\":\"jpg\",\"resource_type\":\"image\",\"created_at\":\"2020-06-10T11:55:30Z\",\"tags\":[],\"bytes\":64893,\"type\":\"upload\",\"etag\":\"aa1a546faf1dad85ef49f6f6a2875602\",\"placeholder\":false,\"url\":\"http://res.cloudinary.com/ginidev/image/upload/v1591790130/hplf6ct1tqorpelxnezi.jpg\",\"secure_url\":\"https://res.cloudinary.com/ginidev/image/upload/v1591790130/hplf6ct1tqorpelxnezi.jpg\",\"access_mode\":\"public\",\"info\":{\"ocr\":{\"adv_ocr\":{\"status\":\"complete\",\"data\":[{\"textAnnotations\":[{\"locale\":\"en\",\"description\":\"OCR test image\\nSOME FONT\\nAnother font\\nOne more\\nlast one\\n\",\"boundingPoly\":{\"vertices\":[{\"x\":89,\"y\":87},{\"x\":1075,\"y\":87},{\"x\":1075,\"y\":492},{\"x\":89,\"y\":492}]}},{\"description\":\"OCR\",\"boundingPoly\":{\"vertices\":[{\"x\":241,\"y\":87},{\"x\":362,\"y\":90},{\"x\":361,\"y\":132},{\"x\":240,\"y\":129}]}},{\"description\":\"test\",\"boundingPoly\":{\"vertices\":[{\"x\":379,\"y\":88},{\"x\":468,\"y\":90},{\"x\":467,\"y\":132},{\"x\":378,\"y\":130}]}},{\"description\":\"image\",\"boundingPoly\":{\"vertices\":[{\"x\":487,\"y\":89},{\"x\":634,\"y\":92},{\"x\":633,\"y\":141},{\"x\":486,\"y\":138}]}},{\"description\":\"SOME\",\"boundingPoly\":{\"vertices\":[{\"x\":92,\"y\":248},{\"x\":201,\"y\":249},{\"x\":200,\"y\":312},{\"x\":91,\"y\":311}]}},{\"description\":\"FONT\",\"boundingPoly\":{\"vertices\":[{\"x\":224,\"y\":255},{\"x\":325,\"y\":256},{\"x\":324,\"y\":312},{\"x\":223,\"y\":311}]}},{\"description\":\"Another\",\"boundingPoly\":{\"vertices\":[{\"x\":508,\"y\":260},{\"x\":837,\"y\":260},{\"x\":837,\"y\":311},{\"x\":508,\"y\":311}]}},{\"description\":\"font\",\"boundingPoly\":{\"vertices\":[{\"x\":900,\"y\":260},{\"x\":1075,\"y\":260},{\"x\":1075,\"y\":311},{\"x\":900,\"y\":311}]}},{\"description\":\"One\",\"boundingPoly\":{\"vertices\":[{\"x\":90,\"y\":446},{\"x\":169,\"y\":448},{\"x\":168,\"y\":481},{\"x\":89,\"y\":479}]}},{\"description\":\"more\",\"boundingPoly\":{\"vertices\":[{\"x\":185,\"y\":455},{\"x\":284,\"y\":458},{\"x\":283,\"y\":484},{\"x\":184,\"y\":481}]}},{\"description\":\"last\",\"boundingPoly\":{\"vertices\":[{\"x\":516,\"y\":442},{\"x\":602,\"y\":441},{\"x\":602,\"y\":491},{\"x\":516,\"y\":492}]}},{\"description\":\"one\",\"boundingPoly\":{\"vertices\":[{\"x\":614,\"y\":451},{\"x\":688,\"y\":451},{\"x\":688,\"y\":479},{\"x\":614,\"y\":479}]}}],\"fullTextAnnotation\":{\"pages\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\",\"confidence\":1}]},\"width\":1144,\"height\":1048,\"blocks\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\",\"confidence\":1}]},\"boundingBox\":{\"vertices\":[{\"x\":241,\"y\":84},{\"x\":634,\"y\":92},{\"x\":633,\"y\":141},{\"x\":240,\"y\":133}]},\"paragraphs\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\",\"confidence\":1}]},\"boundingBox\":{\"vertices\":[{\"x\":241,\"y\":84},{\"x\":634,\"y\":92},{\"x\":633,\"y\":141},{\"x\":240,\"y\":133}]},\"words\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":241,\"y\":87},{\"x\":362,\"y\":90},{\"x\":361,\"y\":132},{\"x\":240,\"y\":129}]},\"symbols\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":241,\"y\":88},{\"x\":279,\"y\":89},{\"x\":278,\"y\":130},{\"x\":240,\"y\":129}]},\"text\":\"O\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":285,\"y\":88},{\"x\":320,\"y\":89},{\"x\":319,\"y\":130},{\"x\":284,\"y\":129}]},\"text\":\"C\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}],\"detectedBreak\":{\"type\":\"SPACE\"}},\"boundingBox\":{\"vertices\":[{\"x\":326,\"y\":89},{\"x\":362,\"y\":90},{\"x\":361,\"y\":130},{\"x\":325,\"y\":129}]},\"text\":\"R\"}]},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":379,\"y\":88},{\"x\":468,\"y\":90},{\"x\":467,\"y\":132},{\"x\":378,\"y\":130}]},\"symbols\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":379,\"y\":90},{\"x\":394,\"y\":90},{\"x\":393,\"y\":129},{\"x\":378,\"y\":129}]},\"text\":\"t\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":396,\"y\":100},{\"x\":423,\"y\":101},{\"x\":422,\"y\":131},{\"x\":395,\"y\":130}]},\"text\":\"e\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":427,\"y\":99},{\"x\":451,\"y\":100},{\"x\":450,\"y\":130},{\"x\":426,\"y\":129}]},\"text\":\"s\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}],\"detectedBreak\":{\"type\":\"SPACE\"}},\"boundingBox\":{\"vertices\":[{\"x\":454,\"y\":90},{\"x\":468,\"y\":90},{\"x\":467,\"y\":130},{\"x\":453,\"y\":130}]},\"text\":\"t\"}]},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":487,\"y\":89},{\"x\":634,\"y\":92},{\"x\":633,\"y\":141},{\"x\":486,\"y\":138}]},\"symbols\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":487,\"y\":89},{\"x\":493,\"y\":89},{\"x\":492,\"y\":128},{\"x\":486,\"y\":128}]},\"text\":\"i\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":500,\"y\":99},{\"x\":540,\"y\":100},{\"x\":539,\"y\":130},{\"x\":499,\"y\":129}]},\"text\":\"m\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":545,\"y\":100},{\"x\":572,\"y\":101},{\"x\":571,\"y\":131},{\"x\":544,\"y\":130}]},\"text\":\"a\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":576,\"y\":99},{\"x\":602,\"y\":100},{\"x\":601,\"y\":141},{\"x\":575,\"y\":140}]},\"text\":\"g\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}],\"detectedBreak\":{\"type\":\"LINE_BREAK\"}},\"boundingBox\":{\"vertices\":[{\"x\":608,\"y\":99},{\"x\":634,\"y\":100},{\"x\":633,\"y\":130},{\"x\":607,\"y\":129}]},\"text\":\"e\"}]}]}],\"blockType\":\"TEXT\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\",\"confidence\":1}]},\"boundingBox\":{\"vertices\":[{\"x\":92,\"y\":248},{\"x\":325,\"y\":251},{\"x\":324,\"y\":314},{\"x\":91,\"y\":311}]},\"paragraphs\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\",\"confidence\":1}]},\"boundingBox\":{\"vertices\":[{\"x\":92,\"y\":248},{\"x\":325,\"y\":251},{\"x\":324,\"y\":314},{\"x\":91,\"y\":311}]},\"words\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":92,\"y\":248},{\"x\":201,\"y\":249},{\"x\":200,\"y\":312},{\"x\":91,\"y\":311}]},\"symbols\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":92,\"y\":248},{\"x\":105,\"y\":248},{\"x\":104,\"y\":311},{\"x\":91,\"y\":311}]},\"text\":\"S\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":116,\"y\":256},{\"x\":135,\"y\":256},{\"x\":134,\"y\":309},{\"x\":115,\"y\":309}]},\"text\":\"O\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":146,\"y\":257},{\"x\":177,\"y\":257},{\"x\":176,\"y\":312},{\"x\":145,\"y\":312}]},\"text\":\"M\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}],\"detectedBreak\":{\"type\":\"SPACE\"}},\"boundingBox\":{\"vertices\":[{\"x\":190,\"y\":257},{\"x\":201,\"y\":257},{\"x\":200,\"y\":310},{\"x\":189,\"y\":310}]},\"text\":\"E\"}]},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":224,\"y\":255},{\"x\":325,\"y\":256},{\"x\":324,\"y\":312},{\"x\":223,\"y\":311}]},\"symbols\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":224,\"y\":256},{\"x\":237,\"y\":256},{\"x\":236,\"y\":309},{\"x\":223,\"y\":309}]},\"text\":\"F\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":244,\"y\":256},{\"x\":263,\"y\":256},{\"x\":262,\"y\":311},{\"x\":243,\"y\":311}]},\"text\":\"O\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":274,\"y\":256},{\"x\":299,\"y\":256},{\"x\":298,\"y\":309},{\"x\":273,\"y\":309}]},\"text\":\"N\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}],\"detectedBreak\":{\"type\":\"LINE_BREAK\"}},\"boundingBox\":{\"vertices\":[{\"x\":306,\"y\":257},{\"x\":325,\"y\":257},{\"x\":324,\"y\":308},{\"x\":305,\"y\":308}]},\"text\":\"T\"}]}]}],\"blockType\":\"TEXT\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\",\"confidence\":1}]},\"boundingBox\":{\"vertices\":[{\"x\":508,\"y\":260},{\"x\":1075,\"y\":260},{\"x\":1075,\"y\":311},{\"x\":508,\"y\":311}]},\"paragraphs\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\",\"confidence\":1}]},\"boundingBox\":{\"vertices\":[{\"x\":508,\"y\":260},{\"x\":1075,\"y\":260},{\"x\":1075,\"y\":311},{\"x\":508,\"y\":311}]},\"words\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":508,\"y\":260},{\"x\":837,\"y\":260},{\"x\":837,\"y\":311},{\"x\":508,\"y\":311}]},\"symbols\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":508,\"y\":264},{\"x\":553,\"y\":264},{\"x\":553,\"y\":309},{\"x\":508,\"y\":309}]},\"text\":\"A\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":558,\"y\":274},{\"x\":597,\"y\":274},{\"x\":597,\"y\":309},{\"x\":558,\"y\":309}]},\"text\":\"n\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":608,\"y\":274},{\"x\":643,\"y\":274},{\"x\":643,\"y\":311},{\"x\":608,\"y\":311}]},\"text\":\"o\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":656,\"y\":264},{\"x\":691,\"y\":264},{\"x\":691,\"y\":311},{\"x\":656,\"y\":311}]},\"text\":\"t\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":702,\"y\":260},{\"x\":741,\"y\":260},{\"x\":741,\"y\":309},{\"x\":702,\"y\":309}]},\"text\":\"h\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":752,\"y\":274},{\"x\":787,\"y\":274},{\"x\":787,\"y\":311},{\"x\":752,\"y\":311}]},\"text\":\"e\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}],\"detectedBreak\":{\"type\":\"SPACE\"}},\"boundingBox\":{\"vertices\":[{\"x\":802,\"y\":274},{\"x\":837,\"y\":274},{\"x\":837,\"y\":309},{\"x\":802,\"y\":309}]},\"text\":\"r\"}]},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":900,\"y\":260},{\"x\":1075,\"y\":260},{\"x\":1075,\"y\":311},{\"x\":900,\"y\":311}]},\"symbols\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":900,\"y\":260},{\"x\":933,\"y\":260},{\"x\":933,\"y\":309},{\"x\":900,\"y\":309}]},\"text\":\"f\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":944,\"y\":274},{\"x\":979,\"y\":274},{\"x\":979,\"y\":311},{\"x\":944,\"y\":311}]},\"text\":\"o\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":990,\"y\":274},{\"x\":1029,\"y\":274},{\"x\":1029,\"y\":309},{\"x\":990,\"y\":309}]},\"text\":\"n\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}],\"detectedBreak\":{\"type\":\"LINE_BREAK\"}},\"boundingBox\":{\"vertices\":[{\"x\":1040,\"y\":264},{\"x\":1075,\"y\":264},{\"x\":1075,\"y\":311},{\"x\":1040,\"y\":311}]},\"text\":\"t\"}]}]}],\"blockType\":\"TEXT\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\",\"confidence\":1}]},\"boundingBox\":{\"vertices\":[{\"x\":90,\"y\":446},{\"x\":284,\"y\":452},{\"x\":283,\"y\":485},{\"x\":89,\"y\":479}]},\"paragraphs\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\",\"confidence\":1}]},\"boundingBox\":{\"vertices\":[{\"x\":90,\"y\":446},{\"x\":284,\"y\":452},{\"x\":283,\"y\":485},{\"x\":89,\"y\":479}]},\"words\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":90,\"y\":446},{\"x\":169,\"y\":448},{\"x\":168,\"y\":481},{\"x\":89,\"y\":479}]},\"symbols\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":90,\"y\":446},{\"x\":120,\"y\":447},{\"x\":119,\"y\":480},{\"x\":89,\"y\":479}]},\"text\":\"O\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":125,\"y\":456},{\"x\":144,\"y\":457},{\"x\":143,\"y\":481},{\"x\":124,\"y\":480}]},\"text\":\"n\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}],\"detectedBreak\":{\"type\":\"SPACE\"}},\"boundingBox\":{\"vertices\":[{\"x\":148,\"y\":457},{\"x\":169,\"y\":458},{\"x\":168,\"y\":481},{\"x\":147,\"y\":480}]},\"text\":\"e\"}]},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":185,\"y\":455},{\"x\":284,\"y\":458},{\"x\":283,\"y\":484},{\"x\":184,\"y\":481}]},\"symbols\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":185,\"y\":456},{\"x\":215,\"y\":457},{\"x\":214,\"y\":482},{\"x\":184,\"y\":481}]},\"text\":\"m\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":219,\"y\":457},{\"x\":237,\"y\":458},{\"x\":236,\"y\":481},{\"x\":218,\"y\":480}]},\"text\":\"o\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":243,\"y\":457},{\"x\":259,\"y\":457},{\"x\":258,\"y\":480},{\"x\":242,\"y\":480}]},\"text\":\"r\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}],\"detectedBreak\":{\"type\":\"LINE_BREAK\"}},\"boundingBox\":{\"vertices\":[{\"x\":263,\"y\":457},{\"x\":284,\"y\":458},{\"x\":283,\"y\":481},{\"x\":262,\"y\":480}]},\"text\":\"e\"}]}]}],\"blockType\":\"TEXT\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\",\"confidence\":1}]},\"boundingBox\":{\"vertices\":[{\"x\":516,\"y\":442},{\"x\":688,\"y\":441},{\"x\":688,\"y\":491},{\"x\":516,\"y\":492}]},\"paragraphs\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\",\"confidence\":1}]},\"boundingBox\":{\"vertices\":[{\"x\":516,\"y\":442},{\"x\":688,\"y\":441},{\"x\":688,\"y\":491},{\"x\":516,\"y\":492}]},\"words\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":516,\"y\":442},{\"x\":602,\"y\":441},{\"x\":602,\"y\":491},{\"x\":516,\"y\":492}]},\"symbols\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":516,\"y\":443},{\"x\":563,\"y\":443},{\"x\":563,\"y\":492},{\"x\":516,\"y\":492}]},\"text\":\"l\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":564,\"y\":443},{\"x\":580,\"y\":443},{\"x\":580,\"y\":492},{\"x\":564,\"y\":492}]},\"text\":\"a\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":581,\"y\":443},{\"x\":596,\"y\":443},{\"x\":596,\"y\":492},{\"x\":581,\"y\":492}]},\"text\":\"s\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}],\"detectedBreak\":{\"type\":\"SPACE\"}},\"boundingBox\":{\"vertices\":[{\"x\":597,\"y\":442},{\"x\":602,\"y\":442},{\"x\":602,\"y\":491},{\"x\":597,\"y\":491}]},\"text\":\"t\"}]},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":614,\"y\":451},{\"x\":688,\"y\":451},{\"x\":688,\"y\":479},{\"x\":614,\"y\":479}]},\"symbols\":[{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":614,\"y\":451},{\"x\":663,\"y\":451},{\"x\":663,\"y\":479},{\"x\":614,\"y\":479}]},\"text\":\"o\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}]},\"boundingBox\":{\"vertices\":[{\"x\":664,\"y\":451},{\"x\":671,\"y\":451},{\"x\":671,\"y\":479},{\"x\":664,\"y\":479}]},\"text\":\"n\"},{\"property\":{\"detectedLanguages\":[{\"languageCode\":\"en\"}],\"detectedBreak\":{\"type\":\"LINE_BREAK\"}},\"boundingBox\":{\"vertices\":[{\"x\":672,\"y\":451},{\"x\":688,\"y\":451},{\"x\":688,\"y\":479},{\"x\":672,\"y\":479}]},\"text\":\"e\"}]}]}],\"blockType\":\"TEXT\"}]}],\"text\":\"OCR test image\\nSOME FONT\\nAnother font\\nOne more\\nlast one\\n\"}}]}}},\"original_filename\":\"textImage\"}"
}
