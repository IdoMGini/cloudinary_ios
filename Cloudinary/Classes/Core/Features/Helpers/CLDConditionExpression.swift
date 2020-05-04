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
import CoreGraphics

open class CLDConditionExpression : CLDExpression {
    
    public func and() -> Self {
        return self
    }
    public func or() -> Self {
        return self
    }
    public func equal(to value: String) -> Self {
        return self
    }
    public func equal(to value: CLDConditionExpression) -> Self {
        return self
    }
    public func notEqual(to value: String) -> Self {
        return self
    }
    public func notEqual(to value: CLDConditionExpression) -> Self {
        return self
    }
    public func less(then value: String) -> Self {
        return self
    }
    public func less(then value: Int) -> Self {
        return self
    }
    public func less(then value: CGFloat) -> Self {
        return self
    }
    public func less(then value: CLDConditionExpression) -> Self {
        return self
    }
    public func greater(then value: String) -> Self {
        return self
    }
    public func greater(then value: Int) -> Self {
        return self
    }
    public func greater(then value: CGFloat) -> Self {
        return self
    }
    public func greater(then value: CLDConditionExpression) -> Self {
        return self
    }
    public func lessOrEqual(to value: String) -> Self {
        return self
    }
    public func lessOrEqual(to value: Int) -> Self {
        return self
    }
    public func lessOrEqual(to value: CGFloat) -> Self {
        return self
    }
    public func lessOrEqual(to value: CLDConditionExpression) -> Self {
        return self
    }
    public func greaterOrEqual(to value: String) -> Self {
        return self
    }
    public func greaterOrEqual(to value: Int) -> Self {
        return self
    }
    public func greaterOrEqual(to value: CGFloat) -> Self {
        return self
    }
    public func greaterOrEqual(to value: CLDConditionExpression) -> Self {
        return self
    }
    public func inside(_ expression: CLDConditionExpression) -> Self {
        return self
    }
    public func inside(_ expression: String) -> Self {
        return self
    }
    public func notInside(_ expression: CLDConditionExpression) -> Self {
        return self
    }
    public func notInside(_ expression: String) -> Self {
        return self
    }
    public func value(_ expression: String) -> Self {
        return self
    }
    public func value(_ expression: CLDExpression) -> Self {
        return self
    }
    
    // MARK: - class func
    public override class func width() -> Self {
        return super.width() as! Self
    }
    
    public override class func height() -> Self {
        return super.height() as! Self
    }
    
    public override class func initialWidth() -> Self {
        return super.initialWidth() as! Self
    }
    
    public override class func initialHeight() -> Self {
        return super.initialHeight() as! Self
    }
    
    public override class func aspectRatio() -> Self {
        return super.aspectRatio() as! Self
    }
    
    public override class func initialAspectRatio() -> Self {
        return super.initialAspectRatio() as! Self
    }
    
    public override class func pageCount() -> Self {
        return super.pageCount() as! Self
    }
    
    public override class func faceCount() -> Self {
        return super.faceCount() as! Self
    }
    
    public override class func tags() -> Self {
        return super.tags() as! Self
    }
    
    public override class func pageXOffset() -> Self {
        return super.pageXOffset() as! Self
    }
    
    public override class func pageYOffset() -> Self {
        return super.pageYOffset() as! Self
    }
    
    public override class func illustrationScore() -> Self {
        return super.illustrationScore() as! Self
    }
    
    public override class func currentPageIndex() -> Self {
        return super.currentPageIndex() as! Self
    }
}
