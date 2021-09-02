//
//  storyboard_mvcTests.swift
//  storyboard_mvcTests
//
//  Created by User on 2021/04/22.
//

import XCTest

class storyboard_mvcTests: XCTestCase {

    
    func testPostListApiResponseNotNil() throws{
       let ex = expectation(description: "testPostListApiResponseNotNil")
        
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success:
                XCTAssertNotNil(response)
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
    
    func testPostListApiResponseCount() {
       let ex = expectation(description: "testPostListApiResponseCount")
        
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success:
                let posts = try! JSONDecoder().decode([Post].self, from: response.data!) 
                XCTAssertEqual(posts.count, 12)
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
    
    func testPostListApiResponseTitle() {
       let ex = expectation(description: "testPostListApiResponseTitle")
        
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success:
                let posts = try! JSONDecoder().decode([Post].self, from: response.data!)
                XCTAssertEqual(posts[0].title, "title 4")
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
