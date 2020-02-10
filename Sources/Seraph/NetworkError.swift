//
//  NetworkError.swift
//  Seraph
//
//  Created by Shadrach Mensah on 01/01/2020.
//  Copyright © 2020 Shadrach Mensah. All rights reserved.
//

import Foundation

public struct NetworkError:Error, ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        customDescription = value
    }
    public var customDescription: String
    public var code:Int = 1
    
    public init(_ err:Error?, code:Int = 1) {
        customDescription = err?.localizedDescription ?? "unknown Error occurred"
    }
    
    public init(stringLiteral value: String, code:Int) {
        customDescription = value
    }
    
    public var localizedDescription: String{
        return customDescription
    }
}
