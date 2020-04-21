//
//  CLDExpression.swift
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

import Foundation

open class CLDExpression: NSObject {
    
    internal var values: [String]
    internal var currentValue: String
    internal var currentExpressionKeys: String
    
    private let separator: String = ","
    private let stringValueInterval: String = "_"
    private let stringValueRegex: String = "[ _]+"
    
    public override init() {
        self.values = []
        self.currentValue = ""
        currentExpressionKeys = ""
        super.init()
    }
    
    public init(value: String) {
        self.values = []
        self.currentValue = ""
        currentExpressionKeys = ""
        super.init()
    }
    
    public init(key: String, operator: CLDOperators, value: String) {
        self.values = []
        self.currentValue = ""
        currentExpressionKeys = ""
        super.init()
    }
    
    public func width() -> Self {
        return self
    }
    
    public func height() -> Self {
        return self
    }
    
    public func initialWidth() -> Self {
        return self
    }
    
    public func initialHeight() -> Self {
        return self
    }
    
    public func aspectRatio() -> Self {
        return self
    }
    
    public func initialAspectRatio() -> Self {
        return self
    }
    
    public func pageCount() -> Self {
        return self
    }
    
    public func faceCount() -> Self {
        return self
    }
    
    public func tags() -> Self {
        return self
    }
    
    public func pageXOffset() -> Self {
        return self
    }
    
    public func pageYOffset() -> Self {
        return self
    }
    
    public func illustrationScore() -> Self {
        return self
    }
    
    public func currentPageIndex() -> Self {
        return self
    }
    
    public func multiple(by number: Int) -> Self {
        return self
    }
    
    public func multiple(by number: CGFloat) -> Self {
        return self
    }
    
    public func divide(by number: Int) -> Self {
        return self
    }
    
    public func divide(by number: CGFloat) -> Self {
        return self
    }
    
    public func add(by number: Int) -> Self {
        return self
    }
    
    public func add(by number: CGFloat) -> Self {
        return self
    }
    
    public func subtract(by number: Int) -> Self {
        return self
    }
    
    public func subtract(by number: CGFloat) -> Self {
        return self
    }
    
    public func asString() -> String {
        return ""
    }
    
    public func asParams() -> [String : String] {
        return [:]
    }
    
    private func replaceAllOperators(in string: String) -> String {
        return ""
    }
    
    private func replace(operator: CLDOperators, in string: String) -> String {
        return ""
    }
}

private enum ExpressionKeys : String {
    case width
    case height
    
    case initial_width
    case initialWidth
    case initial_height
    case initialHeight
    
    case aspect_ratio
    case aspectRatio
    case initial_aspect_ratio
    case initialAspectRatio
    
    case page_count
    case pageCount
    
    case face_count
    case faceCount
    
    case illustration_score
    case illustrationScore
    
    case current_page
    case currentPage
    
    case tags
    
    case pageX
    case pageY
    
    var operatorAsString: String {
        switch self {
        case .width : return "w"
        case .height: return "h"
            
        case .initial_width : return "iw"
        case .initialWidth  : return "iw"
        case .initial_height: return "ih"
        case .initialHeight : return "ih"
            
        case .aspect_ratio        : return "ar"
        case .aspectRatio         : return "ar"
        case .initial_aspect_ratio: return "iar"
        case .initialAspectRatio  : return "iar"
            
        case .page_count: return "pc"
        case .pageCount : return "pc"
            
        case .face_count: return "fc"
        case .faceCount : return "fc"
            
        case .illustration_score: return "ils"
        case .illustrationScore : return "ils"
            
        case .current_page: return "cp"
        case .currentPage : return "cp"
            
        case .tags: return "tags"
        
        case .pageX: return "px"
        case .pageY: return "py"
        }
    }
}
