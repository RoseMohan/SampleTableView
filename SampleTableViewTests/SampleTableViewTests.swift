//
//  SampleTableViewTests.swift
//  SampleTableViewTests
//
//  Created by Rose on 7/6/18.
//  Copyright © 2018 User. All rights reserved.
//

import XCTest
@testable import SampleTableView

class SampleTableViewTests: XCTestCase {
    
    var viewModel : ContetViewModel!
    var dataSource : Content!
    fileprivate var service : WebService!
    
    
    override func setUp() {
        super.setUp()
        self.viewModel = ContetViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
