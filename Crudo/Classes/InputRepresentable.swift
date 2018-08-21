//
//  InputRepresentable.swift
//  Crudo
//
//  Created by Jason Grandelli on 8/17/18.
//

import Foundation

public protocol InputRespresentable {
    /// "friendly" name for displaying user-facing text
    var displayName: String { get }
    
    /// underlying data type
    var value: Any { get }
}

extension String: InputRespresentable {
    public var displayName: String {
        return self
    }
    
    public var value: Any {
        return self
    }
}

extension Bool: InputRespresentable {
    public var displayName: String {
        return self.description
    }
    
    public var value: Any {
        return self
    }
}

extension Int: InputRespresentable {
    public var displayName: String {
        return "\(self)"
    }
    
    public var value: Any {
        return self
    }
}

extension Double: InputRespresentable {
    public var displayName: String {
        return self.description
    }
    
    public var value: Any {
        return self
    }
}
