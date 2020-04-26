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

    fileprivate enum ExpressionKeys : String {
        
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
    
    internal var values: [String] = [] //TODO: I'm not sure we need this var, should we allow the user to make multiple experations in one instance?
    internal var currentValue         : String
    internal var currentExpressionKeys: String
    
    private let separator          : String = ","
    private let elementsSeparator  : String = "_"
    private let stringValueInterval: String = "_"
    private let stringValueRegex   : String = "[ _]+"
    
    // MARK: - Init
    public override init() {
        self.currentExpressionKeys = String()
        self.currentValue          = String()
        super.init()
    }
    
    public init(value: String) {
        self.currentExpressionKeys = String()
        self.currentValue = value
        super.init()
    }
    
    public init(key: String, operator: CLDOperators, value: String) {
        self.currentValue          = value
        self.currentExpressionKeys = key
        super.init()
    }
    
    fileprivate init(expressionKey: ExpressionKeys) {
        self.currentExpressionKeys = String()
        self.currentValue          = expressionKey.asString
        super.init()
    }
    
    // MARK: - Public methods
    public class func width() -> CLDExpression {
        return CLDExpression(expressionKey: .width)
    }
    
    public func height() -> CLDExpression {
        return CLDExpression(expressionKey: .height)
    }
    
    public func initialWidth() -> CLDExpression {
        return CLDExpression(expressionKey: .initialWidth)
    }
    
    public func initialHeight() -> CLDExpression {
        return CLDExpression(expressionKey: .initialHeight)
    }
    
    public func aspectRatio() -> CLDExpression {
        return CLDExpression(expressionKey: .aspectRatio)
    }
    
    public func initialAspectRatio() -> CLDExpression {
        return CLDExpression(expressionKey: .initialAspectRatio)
    }
    
    public func pageCount() -> CLDExpression {
        return CLDExpression(expressionKey: .pageCount)
    }
    
    public func faceCount() -> CLDExpression {
        return CLDExpression(expressionKey: .faceCount)
    }
    
    public func tags() -> CLDExpression {
        return CLDExpression(expressionKey: .tags)
    }
    
    public func pageXOffset() -> CLDExpression {
        return CLDExpression(expressionKey: .pageX)
    }
    
    public func pageYOffset() -> CLDExpression {
        return CLDExpression(expressionKey: .pageY)
    }
    
    public func illustrationScore() -> CLDExpression {
        return CLDExpression(expressionKey: .illustrationScore)
    }
    
    public func currentPageIndex() -> CLDExpression {
        return CLDExpression(expressionKey: .currentPage)
    }
    
    public func multiple(by number: Int) -> Self {
        appendExpression(cldoperator: .multiple, number: number)
        return self
    }
    
    public func multiple(by number: Float) -> Self {
        appendExpression(cldoperator: .multiple, number: number)
        return self
    }
    
    public func divide(by number: Int) -> Self {
        appendExpression(cldoperator: .divide, number: number)
        return self
    }
    
    public func divide(by number: Float) -> Self {
        appendExpression(cldoperator: .divide, number: number)
        return self
    }
    
    public func add(by number: Int) -> Self {
        appendExpression(cldoperator: .add, number: number)
        return self
    }
    
    public func add(by number: Float) -> Self {
        appendExpression(cldoperator: .add, number: number)
        return self
    }
    
    public func subtract(by number: Int) -> Self {
        appendExpression(cldoperator: .subtract, number: number)
        return self
    }
    
    public func subtract(by number: Float) -> Self {
        appendExpression(cldoperator: .subtract, number: number)
        return self
    }
    
    public func asString() -> String {
        return currentValue
    }
    
    public func asParams() -> [String : String] {
        return [:]
    }
    
    // MARK: - Private methods
    private func replaceAllOperators(in string: String) -> String {
        return ""
    }
    
    private func replace(cldoperator: CLDOperators, in string: String) -> String {
        return ""
    }
    
    private func appendExpression(cldoperator: CLDOperators, number: Int) {
        currentValue.append(elementsSeparator + cldoperator.asString() + elementsSeparator + String(number))
    }
    
    private func appendExpression(cldoperator: CLDOperators, number: Float) {
        currentValue.append(elementsSeparator + cldoperator.asString() + elementsSeparator + String(number))
    }
}
