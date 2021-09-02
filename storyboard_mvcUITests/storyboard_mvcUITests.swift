//
//  storyboard_mvcUITests.swift
//  storyboard_mvcUITests
//
//  Created by User on 2021/04/22.
//

import XCTest

class storyboard_mvcUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func testWithStaticText() throws {
        app.launch()
        XCTAssertTrue(app.staticTexts["Storyboard MVC"].exists)
    }
    
    func testWithNavigationTitle() throws {
        app.launch()
        XCTAssert(app.navigationBars["Storyboard MVC"].exists)
    }
    
    
    
    

    func testWithTableViewExist() throws {
        app.launch()
        
        let ex = expectation(description: "testWithTableViewExist")
        
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { [self] response in
            switch response.result {
            case .success:
                XCTAssertTrue(self.app.tables.element.exists)
                ex.fulfill()
            case let .failure(error):
                XCTAssertNil(error)
                ex.fulfill()
            }
        })
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
    
    
    
    func testWithTableViewCellCount() throws {
        app.launch()
        
        let ex = expectation(description: "testWithTableViewCellCount")
        
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success:
                XCTAssertEqual(self.app.tables.cells.count, 12)
                ex.fulfill()
            case let .failure(error):
                XCTAssertNil(error)
                ex.fulfill()
            }
        })
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
        
    }
    
}
