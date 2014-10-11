//
//  SectionedDataSource.swift
//
//  Created by Indragie on 10/7/14.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

import Foundation

struct SectionedDataSource<T: AnyObject> {
    let sections: [Section<T>]
    
    init(sections: [Section<T>]) {
        self.sections = sections
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return sections[section].items.count
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> T {
        return sections[indexPath.section].items[indexPath.row]
    }
}

