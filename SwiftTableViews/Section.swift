//
//  Section.swift
//
//  Created by Indragie on 10/10/14.
//  Copyright (c) 2014 indragie. All rights reserved.
//

import Foundation

public struct Section<T: AnyObject> {
    public let items: [T]
    
    public init(items: [T]) {
        self.items = items
    }
    
    func toObjC() -> SectionObjC {
        return SectionObjC(items: items)
    }
}

@objc class SectionObjC {
    let items: [AnyObject]
    
    init(items: [AnyObject]) {
        self.items = items
    }
}
