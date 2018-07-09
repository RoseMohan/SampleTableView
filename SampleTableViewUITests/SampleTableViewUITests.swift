//
//  SampleTableViewUITests.swift
//  SampleTableViewUITests
//
//  Created by Rose on 7/6/18.
//  Copyright © 2018 User. All rights reserved.
//

import XCTest
@testable import SampleTableView

class SampleTableViewUITests: XCTestCase {
    
    var dataSource : ContetViewModel!

    override func setUp() {
        super.setUp()
        self.dataSource = ContetViewModel()

        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
   
    func testEmptyValueInDataSource() {
        
        // giving empty data value
        dataSource.contentList = []
        
        let tableView = UITableView()
        tableView.dataSource = dataSource.contentList as! UITableViewDataSource
        
        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected zero cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dataSource = nil
        super.tearDown()
    }
    
   
    
}
