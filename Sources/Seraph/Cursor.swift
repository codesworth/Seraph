//
//  Cursor.swift
//  Seraph
//
//  Created by Shadrach Mensah on 03/01/2020.
//  Copyright © 2020 Shadrach Mensah. All rights reserved.
//

import Foundation


/// A Simple structure to encapsulate pagination feature of this loader API
/// This enables user to flexibly provide custom sort Operations whiles abstracting away the details of fetching actaul data
public struct Cursor{
    
    public typealias SortOrder = (Any,Any) -> Bool
    let limit:Int
    let sortOrder:SortOrder?
    var range:CountableRange<Int>
    public var rotations:Int = 0
    
    public init(limit:Int,sortOrder:SortOrder? = nil) {
        self.limit = limit
        self.sortOrder = sortOrder
        range = 0..<limit
    }
    
    public var startIndex:Int{
        return range.startIndex
    }
    
    public var endIndex:Int{
        return range.endIndex
    }
    
    public mutating func next(){
        range = range.endIndex..<range.endIndex.advanced(by: limit)
        rotations += 1
    }
    
}
