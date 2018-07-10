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
   
    // Asynchronous test: success fast, failure slow
    func testValidCallToiTunesGetsHTTPStatusCode200() {
        let url =  URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!
        
        do {
            let datastring = try String.init(contentsOf: url, encoding: String.Encoding.isoLatin1)
            let data =  datastring.data(using: .utf8)
            let deserializedValues = try JSONSerialization.jsonObject(with: data!)
            if (!(deserializedValues is JSONDictionary))
            {
                XCTAssert(false, "Wrong JSON")
            }
            let detailDictionary = deserializedValues as! JSONDictionary
            dataSource = Content(dictionary: detailDictionary)!
        }
        catch{
            XCTFail("Wrong JSON")
        }
       
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
