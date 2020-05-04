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
import CoreGraphics

open class CLDExpression: NSObject {

    fileprivate enum ExpressionKeys : String, CaseIterable {
        
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
        
        var asString: String {
            
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
    
    internal var currentValue      : String
    internal var currentKey        : String
    
    static private let separator          : String = ","
    static private let elementsSeparator  : String = "_"
    static private let stringValueInterval: String = "_"
    static private let stringValueRegex   : String = "[ _]+"
    
    // MARK: - Init
    public override init() {
        self.currentKey   = String()
        self.currentValue = String()
        super.init()
    }
    
    public init(value: String) {
        
        var components = value.components(separatedBy: .whitespacesAndNewlines)
        self.currentKey   = components.removeFirst()
        self.currentValue = components.joined(separator: CLDExpression.elementsSeparator)
        super.init()
    }
    
    fileprivate init(expressionKey: ExpressionKeys) {
        self.currentKey   = expressionKey.asString
        self.currentValue = String()
        super.init()
    }
    
    // MARK: - Public methods
    public func add(by number: Int) -> Self {
        appendOperatorToCurrentValue(.add, inputValue: "\(number)")
        return self
    }
    
    public func add(by number: CGFloat) -> Self {
        appendOperatorToCurrentValue(.add, inputValue: "\(number)")
        return self
    }
    
    public func subtract(by number: Int) -> Self {
        appendOperatorToCurrentValue(.subtract, inputValue: "\(number)")
        return self
    }
    
    public func subtract(by number: CGFloat) -> Self {
        appendOperatorToCurrentValue(.subtract, inputValue: "\(number)")
        return self
    }

    public func multiple(by number: Int) -> Self {
        appendOperatorToCurrentValue(.multiple, inputValue: "\(number)")
        return self
    }
    
    public func multiple(by number: CGFloat) -> Self {
        appendOperatorToCurrentValue(.multiple, inputValue: "\(number)")
        return self
    }
    
    public func divide(by number: Int) -> Self {
        appendOperatorToCurrentValue(.divide, inputValue: "\(number)")
        return self
    }
    
    public func divide(by number: CGFloat) -> Self {
        appendOperatorToCurrentValue(.divide, inputValue: "\(number)")
        return self
    }
    
    // MARK: -
    public func asString() -> String {
        
        guard !currentValue.isEmpty && !currentValue.isEmpty else {
            
            return String()
        }
        
        let key     = replaceAllExpressionKeys(in: currentKey)
        let value   = replaceAllUnEncodeChars(in: currentValue)
        
        return "\(key)_\(value)"
    }
    
    public func asParams() -> [String : String] {
        
        guard !currentValue.isEmpty && !currentValue.isEmpty else {
            
            return [String : String]()
        }
        
        let key     = replaceAllExpressionKeys(in: currentKey)
        let value   = replaceAllUnEncodeChars(in: currentValue)
        
        return [key:value]
    }
    
    // MARK: - Private methods
    private func replaceAllUnEncodeChars(in string: String) -> String {
        
        var wipString   = string
        wipString       = replaceAllOperators(in: string)
        wipString       = replaceAllExpressionKeys(in: wipString)
        
        return wipString
    }
    
    private func replaceAllOperators(in string: String) -> String {
        
        var wipString = string
        CLDOperators.allCases.forEach {
                wipString = replace(cldOperator: $0, in: wipString)
        }
        
        return wipString
    }
    
    private func replace(cldOperator: CLDOperators, in string: String) -> String {
        
        return string.replacingOccurrences(of: cldOperator.rawValue, with: cldOperator.asString())
    }
    
    private func replaceAllExpressionKeys(in string: String) -> String {
        
        var wipString = string
        ExpressionKeys.allCases.forEach {
                
            wipString = replace(expressionKeys: $0, in: wipString)
        }
        
        return wipString
    }
    
    private func replace(expressionKeys: ExpressionKeys, in string: String) -> String {
        
        return string.replacingOccurrences(of: expressionKeys.rawValue, with: expressionKeys.asString)
    }
    
    private func appendOperatorToCurrentValue(_ cldoperator: CLDOperators, inputValue: String) {
        
        if currentValue.isEmpty {
            
            currentValue.append(cldoperator.rawValue + CLDExpression.elementsSeparator + inputValue)
        }
        else {
         
            currentValue.append(CLDExpression.elementsSeparator + cldoperator.rawValue + CLDExpression.elementsSeparator + inputValue)
        }
    }
    
    // MARK: - class func
    public class func width() -> Self {
        return CLDExpression(expressionKey: .width) as! Self
    }
    
    public class func height() -> Self {
        return CLDExpression(expressionKey: .height) as! Self
    }
    
    public class func initialWidth() -> Self {
        return CLDExpression(expressionKey: .initialWidth) as! Self
    }
    
    public class func initialHeight() -> Self {
        return CLDExpression(expressionKey: .initialHeight) as! Self
    }
    
    public class func aspectRatio() -> Self {
        return CLDExpression(expressionKey: .aspectRatio) as! Self
    }
    
    public class func initialAspectRatio() -> Self {
        return CLDExpression(expressionKey: .initialAspectRatio) as! Self
    }
    
    public class func pageCount() -> Self {
        return CLDExpression(expressionKey: .pageCount) as! Self
    }
    
    public class func faceCount() -> Self {
        return CLDExpression(expressionKey: .faceCount) as! Self
    }
    
    public class func tags() -> Self {
        return CLDExpression(expressionKey: .tags) as! Self
    }
    
    public class func pageXOffset() -> Self {
        return CLDExpression(expressionKey: .pageX) as! Self
    }
    
    public class func pageYOffset() -> Self {
        return CLDExpression(expressionKey: .pageY) as! Self
    }
    
    public class func illustrationScore() -> Self {
        return CLDExpression(expressionKey: .illustrationScore) as! Self
    }
    
    public class func currentPageIndex() -> Self {
        return CLDExpression(expressionKey: .currentPage) as! Self
    }
}
