//
//  TableViewDataSource.swift
//
//  Created by Indragie on 10/6/14.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

import UIKit

public struct TableViewDataSource<T: AnyObject, U: UITableViewCell where U: ReusableCell> {
    public typealias CellConfigurator = (T, U) -> Void
    
    let dataSource: SectionedDataSource<T>
    let configurator: CellConfigurator

    public init(sections: [Section<T>], configurator: CellConfigurator) {
        self.dataSource = SectionedDataSource(sections: sections)
        self.configurator = configurator
    }
    
    public func numberOfSections() -> Int {
        return dataSource.sections.count
    }
    
    public func numberOfRowsInSection(section: Int) -> Int {
        return dataSource.numberOfItemsInSection(section)
    }
    
    public func itemAtIndexPath(indexPath: NSIndexPath) -> T {
        return dataSource.itemAtIndexPath(indexPath)
    }
    
    public func toObjC() -> TableViewDataSourceObjC {
        let sections = dataSource.sections.map { section in section.toObjC() }
        let configurator = self.configurator
        return TableViewDataSourceObjC(sections: sections, reuseIdentifier: U.reuseIdentifier()) { (object, cell) in
            configurator(object as T, cell as U)
        }
    }
}

public class TableViewDataSourceObjC: NSObject, UITableViewDataSource {
    typealias ObjCCellConfigurator = (AnyObject, AnyObject) -> Void
    
    let sections: [SectionObjC]
    let reuseIdentifier: String
    let configurator: ObjCCellConfigurator
    
    init(sections: [SectionObjC], reuseIdentifier: String, configurator: ObjCCellConfigurator) {
        self.sections = sections
        self.reuseIdentifier = reuseIdentifier
        self.configurator = configurator
    }
    
    // MARK: UITableViewDataSource
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as? UITableViewCell {
            let object: AnyObject = sections[indexPath.section].items[indexPath.row]
            self.configurator(object, cell)
            return cell
        } else {
            assert(false, "Unable to create table view cell for reuse identifier \(reuseIdentifier)")
        }
    }
}
