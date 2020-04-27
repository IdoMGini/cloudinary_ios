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
    // fatalError(message)
}

open class CLDVariable: NSObject {
    
    internal var value: String
    internal var name : String {
        didSet { self.addNamePrefixIfNeeded() }
    }
    
    static internal let variableParamKey  : String = "variable_param_key"
    
    static internal let variableNamePrefix: String = "$"
    
    static private let collectionPrefix   : String = "!"
    static private let collectionSuffix   : String = "!"
    static private let collectionSeparator: String = ":"
    
    static private let exportSeparator: String = "_"
    
    static private let separator: String = ","
    
    static private let nameRegex: String = "^\\$[a-zA-Z][a-zA-Z0-9]*$"


    // MARK: - Init
    internal override init() {
        self.name  = String()
        self.value = String()
        super.init()
        self.addNamePrefixIfNeeded()
    }
    
    public init(name variableName: String, value variableValue: String) {
        self.name  = variableName
        self.value = variableValue
        super.init()
        self.addNamePrefixIfNeeded()
    }
    
    public init(name variableName: String, value variableValue: Double) {
        self.name = variableName
        self.value = String(variableValue)
        super.init()
        self.addNamePrefixIfNeeded()
    }
    
    public init(name variableName: String, value variableValue: Int) {
        self.name = variableName
        self.value = String(variableValue)
        super.init()
        self.addNamePrefixIfNeeded()
    }
    
    public init(name variableName: String, values: [String]) {
        self.name = variableName
        
        if values.isEmpty {
            self.value = String()
        } else {
            self.value = CLDVariable.collectionPrefix + values.joined(separator: CLDVariable.collectionSeparator) + CLDVariable.collectionSuffix
        }
        
        super.init()
        self.addNamePrefixIfNeeded()
    }
    
    // MARK: - Public methods
    public func asString() -> String {
        guard checkValidName(name) else { return String() }
        return name + CLDVariable.exportSeparator + value
    }
    
    public func asParams() -> [String : String] {
        guard checkValidName(name) else { return [String:String]() }
        return [name:value]
    }
    
    // MARK: - Private methods
    private func checkValidName(_ name: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: CLDVariable.nameRegex, options: .caseInsensitive)
        let range = NSRange(location: 0, length: name.count)
        
        let isValid = regex.firstMatch(in: name, options: [], range: range) != nil
        
        if !isValid {
            CLDThrowFatalError(with: "\(#function) failed!")
        }
        return isValid
    }
    
    private func addNamePrefixIfNeeded() {
        guard !checkValidName(name) else { return }
        guard !name.hasPrefix(CLDVariable.variableNamePrefix) else { return }
        name = addPrefix(to: name)
    }
    
    private func addPrefix(to name: String) -> String {
        return CLDVariable.variableNamePrefix + name
    }
}