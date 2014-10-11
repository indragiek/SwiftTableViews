//
//  SectionedDataSource.swift
//
//  Created by Indragie on 10/7/14.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

public struct SectionedDataSource<T: AnyObject> {
    public let sections: [Section<T>]
    
    public init(sections: [Section<T>]) {
        self.sections = sections
    }
}

