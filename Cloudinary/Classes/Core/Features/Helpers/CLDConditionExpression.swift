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
    
    // MARK: - Init
    private init(_ expression: CLDExpression) {
        
        super.init(value: expression.asInternalString())
    }
    
    public override init() {
        
        super.init()
    }
    
    public override init(value: String) {
        
        super.init(value: value)
    }
    
    // MARK: - Public Methods
    @discardableResult
    public func and() -> Self {
        
        appendOperatorToCurrentValue(.and)
        return self
    }
    
    @discardableResult
    public func or() -> Self {
        
        appendOperatorToCurrentValue(.or)
        return self
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
    public func notEqual(to value: String) -> Self {
        
        appendingStringToCurrentValue(cldoperator: .notEqual, inputValue: value)
        return self
    }
    
    @discardableResult
    public func notEqual(to value: CLDExpression) -> Self {
        return notEqual(to: value.asInternalString())
    }
    
    @discardableResult
    public func less(then value: String) -> Self {
        
        appendingStringToCurrentValue(cldoperator: .lessThen, inputValue: value)
        return self
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
    public func less(then value: CLDExpression) -> Self {
       
        return less(then: value.asInternalString())
    }
    
    @discardableResult
    public func greater(then value: String) -> Self {
        
        appendingStringToCurrentValue(cldoperator: .greaterThen, inputValue: value)
        return self
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
    public func greater(then value: CLDExpression) -> Self {
        
        return greater(then: value.asInternalString())
    }
    
    @discardableResult
    public func lessOrEqual(to value: String) -> Self {
        
        appendingStringToCurrentValue(cldoperator: .lessOrEqual, inputValue: value)
        return self
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
    public func lessOrEqual(to value: CLDExpression) -> Self {
        
        return lessOrEqual(to: value.asInternalString())
    }
    
    @discardableResult
    public func greaterOrEqual(to value: String) -> Self {
        
        appendingStringToCurrentValue(cldoperator: .lessOrEqual, inputValue: value)
        return self
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
    public func greaterOrEqual(to value: CLDExpression) -> Self {
        
        return greaterOrEqual(to: value.asInternalString())
    }
    
    @discardableResult
    public func inside(_ expression: CLDExpression) -> Self {
        
        return inside(expression.asInternalString())
    }
    
    @discardableResult
    public func inside(_ expression: String) -> Self {
        
        guard !expression.isEmpty else {
            
            return self
        }
        
        appendingStringToCurrentValue(cldoperator: .inside, inputValue: expression)
        return self
    }
    
    @discardableResult
    public func notInside(_ expression: CLDExpression) -> Self {
        
        return notInside(expression.asInternalString())
    }
    
    @discardableResult
    public func notInside(_ expression: String) -> Self {
        
        guard !expression.isEmpty else {
            
            return self
        }
        
        appendingStringToCurrentValue(cldoperator: .notInside, inputValue: expression)
        return self
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
            
            currentValue.append(CLDExpression.elementsSeparator + value)
        }
        
        return self
    }
    
    @discardableResult
    public func value(_ expression: CLDExpression) -> Self {
        
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
    
    // MARK: - Class Func
    public override class func width() -> Self {
        
        return CLDConditionExpression(super.width()) as! Self
    }
    
    public override class func height() -> Self {
        
        return CLDConditionExpression(super.height()) as! Self
    }
    
    public override class func initialWidth() -> Self {
        
        return CLDConditionExpression(super.initialWidth()) as! Self
    }
    
    public override class func initialHeight() -> Self {
        
        return CLDConditionExpression(super.initialHeight()) as! Self
    }
    
    public override class func aspectRatio() -> Self {
        return CLDConditionExpression(super.aspectRatio()) as! Self
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
}
