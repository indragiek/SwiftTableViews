//
//  ViewController.swift
//  SwiftTableViews
//
//  Created by Indragie on 10/10/14.
//  Copyright (c) 2014 indragie. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dataSourceObjC: TableViewDataSourceObjC!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let section = Section(items: [
            "Apple",
            "Banana",
            "Orange",
            "Strawberry"
        ])
        let dataSource = TableViewDataSource(sections: [section]) { (text, cell: TextCell) in
            cell.textLabel?.text = text
            return
        }
        
        dataSourceObjC = dataSource.toObjC()
        self.tableView.registerClass(TextCell.self, forCellReuseIdentifier: TextCell.reuseIdentifier())
        self.tableView.dataSource = dataSourceObjC
    }
}

