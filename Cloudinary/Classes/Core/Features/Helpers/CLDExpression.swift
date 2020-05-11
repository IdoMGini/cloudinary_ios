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
    
    static private  let separator          : String = ","
    static internal let elementsSeparator  : String = "_"
    static internal let stringValueInterval: String = "_"
    static private  let stringValueRegex   : String = "[ _]+"
    
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
    @discardableResult
    public func add(by number: Int) -> Self {
        appendOperatorToCurrentValue(.add, inputValue: "\(number)")
        return self
    }
    
    @discardableResult
    public func add(by number: Float) -> Self {
        appendOperatorToCurrentValue(.add, inputValue: number.cldFloatFormat())
        return self
    }
    
    @discardableResult
    public func subtract(by number: Int) -> Self {
        appendOperatorToCurrentValue(.subtract, inputValue: "\(number)")
        return self
    }
    
    @discardableResult
    public func subtract(by number: Float) -> Self {
        appendOperatorToCurrentValue(.subtract, inputValue: number.cldFloatFormat())
        return self
    }

    @discardableResult
    public func multiple(by number: Int) -> Self {
        appendOperatorToCurrentValue(.multiple, inputValue: "\(number)")
        return self
    }
    
    @discardableResult
    public func multiple(by number: Float) -> Self {
        appendOperatorToCurrentValue(.multiple, inputValue: number.cldFloatFormat())
        return self
    }
    
    @discardableResult
    public func divide(by number: Int) -> Self {
        appendOperatorToCurrentValue(.divide, inputValue: "\(number)")
        return self
    }
    
    @discardableResult
    public func divide(by number: Float) -> Self {
        appendOperatorToCurrentValue(.divide, inputValue: number.cldFloatFormat())
        return self
    }
    
    @discardableResult
    public func power(by number: Int) -> Self {
        appendOperatorToCurrentValue(.power, inputValue: "\(number)")
        return self
    }
    
    @discardableResult
    public func power(by number: Float) -> Self {
        appendOperatorToCurrentValue(.power, inputValue: number.cldFloatFormat())
        return self
    }
    
    // MARK: -
    public func asString() -> String {
        
        guard !currentKey.isEmpty && !currentValue.isEmpty else {
            
            return String()
        }
        
        let key     = replaceAllExpressionKeys(in: currentKey)
        let value   = replaceAllUnEncodeChars(in: currentValue)
        
        return "\(key)_\(value)"
    }
    
    internal func asInternalString() -> String {

        guard !currentValue.isEmpty else {
        
            return "\(currentKey)"
        }
        return "\(currentKey) \(currentValue)"
    }
    
    public func asParams() -> [String : String] {
        
        guard !currentKey.isEmpty && !currentValue.isEmpty else {
            
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
    
    internal func appendOperatorToCurrentValue(_ cldoperator: CLDOperators, inputValue: String = String()) {
        
        var stringValue = String()
        if !currentValue.isEmpty {
           
            stringValue.append(CLDExpression.elementsSeparator)
        }
        
        stringValue.append(cldoperator.rawValue)
        
        if !inputValue.isEmpty {
         
            stringValue.append(CLDExpression.elementsSeparator + inputValue)
        }
        
        currentValue.append(stringValue)
    }
    
    // MARK: - class func
    public class func width() -> CLDExpression {
        return CLDExpression(expressionKey: .width)
    }
    
    public class func height() -> CLDExpression {
        return CLDExpression(expressionKey: .height)
    }
    
    public class func initialWidth() -> CLDExpression {
        return CLDExpression(expressionKey: .initialWidth)
    }
    
    public class func initialHeight() -> CLDExpression {
        return CLDExpression(expressionKey: .initialHeight)
    }
    
    public class func aspectRatio() -> CLDExpression {
        return CLDExpression(expressionKey: .aspectRatio)
    }
    
    public class func initialAspectRatio() -> CLDExpression {
        return CLDExpression(expressionKey: .initialAspectRatio)
    }
    
    public class func pageCount() -> CLDExpression {
        return CLDExpression(expressionKey: .pageCount)
    }
    
    public class func faceCount() -> CLDExpression {
        return CLDExpression(expressionKey: .faceCount)
    }
    
    public class func tags() -> CLDExpression {
        return CLDExpression(expressionKey: .tags)
    }
    
    public class func pageXOffset() -> CLDExpression {
        return CLDExpression(expressionKey: .pageX)
    }
    
    public class func pageYOffset() -> CLDExpression {
        return CLDExpression(expressionKey: .pageY)
    }
    
    public class func illustrationScore() -> CLDExpression {
        return CLDExpression(expressionKey: .illustrationScore)
    }
    
    public class func currentPageIndex() -> CLDExpression {
        return CLDExpression(expressionKey: .currentPage) 
    }
}
