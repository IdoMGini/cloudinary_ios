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

internal func CLDThrowFatalError(with message: String) {
    fatalError(message)
}

open class CLDVariable: NSObject {
    
    internal var variableName : String
    internal var variableValue: String
    
    internal static let variableParamKey: String = "variable_param_key"
    
    private let variableNamePrefix: String = "$"
    
    private let collectionPrefix   : String = "!"
    private let collectionSuffix   : String = "!"
    private let collectionSeparator: String = ":"
    
    private let exportSeparator: String = "_"
    
    private let separator: String = ","
    
    private let nameRegex: String = "^\\$[a-zA-Z][a-zA-Z0-9]*$"


    // MARK: - Init
    public override init() {
        self.variableName  = ""
        self.variableValue = ""
        super.init()
    }
    
    public init(variableName: String, variableValue: String) {
        self.variableName = variableName
        self.variableValue = variableValue
        super.init()
        self.addNamePrefixIfNeeded()
    }
    
    public init(variableName: String, variableValue: Double) {
        self.variableName = variableName
        self.variableValue = String(variableValue)
        super.init()
        self.addNamePrefixIfNeeded()
    }
    
    public init(variableName: String, variableValue: Int) {
        self.variableName = variableName
        self.variableValue = String(variableValue)
        super.init()
        self.addNamePrefixIfNeeded()
    }
    
    public init(variableName: String, variableValues: [String]) {
        self.variableName = variableName
        
        if variableValues.isEmpty {
            self.variableValue = String()
        } else {
            self.variableValue = collectionPrefix + variableValues.joined(separator: collectionSeparator) + collectionSuffix
        }
        
        super.init()
        self.addNamePrefixIfNeeded()
    }
    
    // MARK: - Public methods
    public func checkVariableName() -> Bool {
        let regex = try! NSRegularExpression(pattern: nameRegex, options: .caseInsensitive)
        let range = NSRange(location: 0, length: variableName.count)
        
        let isValid = regex.firstMatch(in: variableName, options: [], range: range) != nil
        
        if !isValid {
            CLDThrowFatalError(with: "\(#function) failed!")
        }
        return isValid
    }
    
    public func asString() -> String {
        return variableName + exportSeparator + variableValue
    }
    
    public func asParams() -> [String : String] {
        return [CLDVariable.variableParamKey:asString()]
    }
    
    // MARK: - Private methods
    private func addNamePrefixIfNeeded() {
        guard !variableName.hasPrefix(variableNamePrefix) else { return }
        variableName = addNamePrefix(to: variableName)
    }
    
    private func addNamePrefix(to name: String) -> String {
        return variableNamePrefix + name
    }
}
