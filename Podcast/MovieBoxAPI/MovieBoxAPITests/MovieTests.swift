//
//  MovieTests.swift
//  MovieBoxAPITests
//
//  Created by Mahmud CIKRIK on 21.11.2023.
//

import XCTest
@testable import MovieBoxAPI

final class MovieTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws { //try eğer fail olursa throws ekleyince bu fonksiyon fail oluyor.
        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()

        let bundle = Bundle(for: MovieTests.self)
        let url = bundle.url(forResource: "movie", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let movie = try decoder.decode(Movie.self, from: data)
        print(movie)
        
        XCTAssertEqual(movie.artistName, "Casefile Presents")
        XCTAssertEqual(movie.name, "The Bakersfield Three")
        XCTAssertEqual(movie.rating, "Explict")
        XCTAssertEqual(movie.genres.first?.name, "True Crime")
        XCTAssertEqual(movie.genres.first?.name, "True Crime")
        XCTAssertEqual(movie.genres.count, 2)


        
        
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
