//
//  CLDConditionExpression.swift
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

open class CLDConditionExpression : CLDExpression {
    
    var relatedTransformation: CLDTransformation
    
    // MARK: - Init
    private init(_ expression: CLDExpression) {
        
        self.relatedTransformation = CLDTransformation()
        
        super.init(value: expression.asInternalString())
    }
    
    public override init() {
        self.relatedTransformation = CLDTransformation()
        super.init()
    }
    
    public override init(value: String) {
        self.relatedTransformation = CLDTransformation()
        super.init(value: value)
    }
    // MARK: -
    public override func asString() -> String {
        // TODO: OZ
        return super.asString()
        // guard !currentKey.isEmpty && !currentValue.isEmpty else {
        //
        //     return String()
        // }
        //
        // let key   = replaceAllExpressionKeys(in: currentKey)
        // let value = replaceAllUnencodeChars(in: currentValue).removeExtraDashes()
        //
        // return "\(key)_\(value)"
    }
    
    // MARK: - Public Methods
    @discardableResult
    public func and() -> Self {
        appendOperatorToCurrentValue(.and)
        return self
    }
    @discardableResult
    public func and(_ value: CLDExpression) -> Self {
        appendingStringToCurrentValue(cldoperator: .and, inputValue: value.asInternalString())
        return self
    }
    @discardableResult
    public func and(expresion value: CLDConditionExpression) -> Self {
        return and(value)
    }
    
    @discardableResult
    public func or() -> Self {
        appendOperatorToCurrentValue(.or)
        return self
    }
    @discardableResult
    public func or(_ value: CLDExpression) -> Self {
        appendingStringToCurrentValue(cldoperator: .or, inputValue: value.asInternalString())
        return self
    }
    @discardableResult
    public func or(expresion value: CLDConditionExpression) -> Self {
        return or(value)
    }
    
    @discardableResult
    public func equal(to value: Int) -> Self {
        return equal(to: String(value))
    }
    @discardableResult
    public func equal(to value: Float) -> Self {
        return equal(to: value.cldFloatFormat())
    }
    @discardableResult
    public func equal(to value: String) -> Self {
        appendingStringToCurrentValue(cldoperator: .equal, inputValue: value)
        return self
    }
    @discardableResult
    public func equal(to value: CLDExpression) -> Self {
        return equal(to: value.asInternalString())
    }
    @discardableResult
    public func equal(_  value: CLDConditionExpression) -> Self {
        return equal(to: value)
    }
    
    @discardableResult
    public func notEqual(to value: Int) -> Self {
        return notEqual(to: String(value))
    }
    @discardableResult
    public func notEqual(to value: Float) -> Self {
        return notEqual(to: value.cldFloatFormat())
    }
    @discardableResult
    public func notEqual(to value: String) -> Self {
        appendingStringToCurrentValue(cldoperator: .notEqual, inputValue: value)
        return self
    }
    @discardableResult
    public func notEqual(to value: CLDExpression) -> Self {
        return notEqual(to: value.asInternalString())
    }
    @discardableResult
    public func notEqual(_  value: CLDConditionExpression) -> Self {
        return notEqual(to: value)
    }
    
    @discardableResult
    public func less(then value: Int) -> Self {
        return less(then: String(value))
    }
    @discardableResult
    public func less(then value: Float) -> Self {
        return less(then: value.cldFloatFormat())
    }
    @discardableResult
    public func less(then value: String) -> Self {
        appendingStringToCurrentValue(cldoperator: .lessThen, inputValue: value)
        return self
    }
    @discardableResult
    public func less(then value: CLDExpression) -> Self {
        return less(then: value.asInternalString())
    }
    @discardableResult
    public func less(_    value: CLDConditionExpression) -> Self {
        return less(then: value)
    }
    
    @discardableResult
    public func greater(then value: Int) -> Self {
        return greater(then: String(value))
    }
    @discardableResult
    public func greater(then value: Float) -> Self {
        return greater(then: value.cldFloatFormat())
    }
    @discardableResult
    public func greater(then value: String) -> Self {
        appendingStringToCurrentValue(cldoperator: .greaterThen, inputValue: value)
        return self
    }
    @discardableResult
    public func greater(then value: CLDExpression) -> Self {
        return greater(then: value.asInternalString())
    }
    @discardableResult
    public func greater(_    value: CLDConditionExpression) -> Self {
        return greater(then: value)
    }
    
    @discardableResult
    public func lessOrEqual(to value: Int) -> Self {
        return lessOrEqual(to: String(value))
    }
    @discardableResult
    public func lessOrEqual(to value: Float) -> Self {
        return lessOrEqual(to: value.cldFloatFormat())
    }
    @discardableResult
    public func lessOrEqual(to value: String) -> Self {
        appendingStringToCurrentValue(cldoperator: .lessOrEqual, inputValue: value)
        return self
    }
    @discardableResult
    public func lessOrEqual(to value: CLDExpression) -> Self {
        return lessOrEqual(to: value.asInternalString())
    }
    @discardableResult
    public func lessOrEqual(_  value: CLDConditionExpression) -> Self {
        return lessOrEqual(to: value)
    }
    
    @discardableResult
    public func greaterOrEqual(to value: Int) -> Self {
        return greaterOrEqual(to: String(value))
    }
    @discardableResult
    public func greaterOrEqual(to value: Float) -> Self {
        return greaterOrEqual(to: value.cldFloatFormat())
    }
    @discardableResult
    public func greaterOrEqual(to value: String) -> Self {
        appendingStringToCurrentValue(cldoperator: .greaterOrEqual, inputValue: value)
        return self
    }
    @discardableResult
    public func greaterOrEqual(to value: CLDExpression) -> Self {
        return greaterOrEqual(to: value.asInternalString())
    }
    @discardableResult
    public func greaterOrEqual(_  value: CLDConditionExpression) -> Self {
        return lessOrEqual(to: value)
    }
    
    @discardableResult
    public func inside(_ expression: String) -> Self {
        
        guard !expression.isEmpty else { return self }
        appendingStringToCurrentValue(cldoperator: .inside, inputValue: expression)
        return self
    }
    @discardableResult
    public func inside(_ expression: CLDExpression) -> Self {
        return inside(expression.asInternalString())
    }
    @discardableResult
    public func inside(_  expression: CLDConditionExpression) -> Self {
        return inside(expression.asInternalString())
    }
    
    @discardableResult
    public func notInside(_ expression: String) -> Self {
        
        guard !expression.isEmpty else { return self }
        appendingStringToCurrentValue(cldoperator: .notInside, inputValue: expression)
        return self
    }
    @discardableResult
    public func notInside(_ expression: CLDExpression) -> Self {
        return notInside(expression.asInternalString())
    }
    @discardableResult
    public func notInside(_  expression: CLDConditionExpression) -> Self {
        return notInside(expression)
    }
    
    @discardableResult
    public func value(_ expression: String) -> Self {
        
        let expressionObject = CLDExpression.init(value: expression)
        
        let value: String
        if  expressionObject.currentValue.isEmpty {
            
            value = expression
        } else {
         
            value = expressionObject.asString()
        }
        
        if !expressionObject.currentValue.isEmpty && currentKey.isEmpty {
            currentKey      = expressionObject.currentKey
            currentValue    = expressionObject.currentValue
        }
        else if expressionObject.currentValue.isEmpty && currentKey.isEmpty {
            currentKey      = value
        }
        else if currentValue.isEmpty {
           
            currentValue.append(value)
        } else {
            
            currentValue.append(CLDVariable.elementsSeparator + value)
        }
        return self
    }
    @discardableResult
    public func value(_  expression: CLDExpression) -> Self {
        return value(expression.asInternalString())
    }
    @discardableResult
    public func value(of expression: CLDConditionExpression) -> Self {
        return value(expression.asInternalString())
    }
    
    // MARK: - Private Methods
    private func appendingStringToCurrentValue(cldoperator: CLDOperators, inputValue: String) {
        
        let expression = CLDExpression.init(value: inputValue)
        
        let value: String
        if  expression.currentValue.isEmpty {
            
            value = inputValue
        }else {
         
            value = expression.asString()
        }
        
        appendOperatorToCurrentValue(cldoperator, inputValue: value)
    }
    
    // MARK: - then
    @objc(then)
    public func then() -> CLDTransformation {
        
        return relatedTransformation.ifCondition(self)
    }
    
    // MARK: - Class Func
    public override class func width() -> Self {
        return CLDConditionExpression(super.width()) as! Self
    }
    public override class func height() -> Self {
        return CLDConditionExpression(super.height()) as! Self
    }
    public override class func aspectRatio() -> Self {
        return CLDConditionExpression(super.aspectRatio()) as! Self
    }
    
    public override class func initialWidth() -> Self {
        return CLDConditionExpression(super.initialWidth()) as! Self
    }
    public override class func initialHeight() -> Self {
        return CLDConditionExpression(super.initialHeight()) as! Self
    }
    public override class func initialAspectRatio() -> Self {
        return CLDConditionExpression(super.initialAspectRatio()) as! Self
    }
    
    public override class func pageCount() -> Self {
        return CLDConditionExpression(super.pageCount()) as! Self
    }
    public override class func faceCount() -> Self {
        return CLDConditionExpression(super.faceCount()) as! Self
    }
    
    public override class func tags() -> Self {
        return CLDConditionExpression(super.tags()) as! Self
    }
    
    public override class func pageXOffset() -> Self {
        return CLDConditionExpression(super.pageXOffset()) as! Self
    }
    public override class func pageYOffset() -> Self {
        return CLDConditionExpression(super.pageYOffset()) as! Self
    }
    
    public override class func illustrationScore() -> Self {
        return CLDConditionExpression(super.illustrationScore()) as! Self
    }
    
    public override class func currentPageIndex() -> Self {
        return CLDConditionExpression(super.currentPageIndex()) as! Self
    }
    public override class func duration() -> Self {
        return CLDConditionExpression(super.duration()) as! Self
    }
    public override class func initialDuration() -> Self {
        return CLDConditionExpression(super.initialDuration()) as! Self
    }
    
    
    // MARK: - instance func
    public func width(_ operatorString: String, _ object: Int) -> Self {
        return predicate(expressionKey: .width, operatorString: operatorString, inputValue: String(object))
    }
    
    fileprivate func predicate(expressionKey: ExpressionKeys, operatorString: String, inputValue: String) -> Self {
        
        
        if CLDOperators.allCases.compactMap({ $0.asString() }).contains(operatorString) {
            // TODO: OZ
            currentKey = expressionKey.asString
            appendOperatorToCurrentValue(operatorString, inputValue: inputValue)
        }
        return self
    }
}
