//
//  CLDVariable.swift
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

open class CLDVariable: NSObject {
    
    internal var variablesName: String = ""
    internal var variableValue: String = ""
    
    private let variableNamePrefix: String = "$"
    private let variablePrefix: String = "!"
    private let variableSuffix: String = "!"
    private let separator: String = ","
    private let stringSeparator: String = ":"
    private let nameRegex = "^\\$[a-zA-Z][a-zA-Z0-9]*$"


    // MARK: - Init
    public override init() {
        super.init()
    }
    
    public init(variablesName: String, variableValue: String) {
        self.variablesName = variablesName
        self.variableValue = variableValue
        super.init()
    }
    
    public init(variablesName: String, variableValue: Double) {
        self.variablesName = variablesName
        self.variableValue = String(variableValue)
        super.init()
    }
    
    public init(variablesName: String, variableValue: Int) {
        self.variablesName = variablesName
        self.variableValue = String(variableValue)
        super.init()
    }
    
    public init(variablesName: String, variableValue: [String]) {
        self.variablesName = variablesName
        self.variableValue = String(variableValue.reduce("", {$0 + $1}))
        super.init()
    }
    
    private func addNamePrefix(to variablesName: String) -> String {
        return variableNamePrefix + variablesName
    }
    
    private func checkVariableName(variablesName: String) -> Bool {
        let regexExpression = try! NSRegularExpression(pattern: nameRegex, options: .caseInsensitive)
        
        let isValid = regexExpression.firstMatch(in: variablesName, options: [], range: NSRange(location: 0, length: variablesName.count)) != nil
        
        if isValid == false {
            fatalError("checkVariableName failed!")
        } else {
            return true
        }
    }
    
    public func asString() -> String {
        return variablesName + "_" + variableValue
    }
    
    public func asParams() -> [String : String] {
        return [variablesName:asString()]
    }
}

