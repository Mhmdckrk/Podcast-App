//
//  MovieBoxTests.swift
//  MovieBoxTests
//
//  Created by Mahmud CIKRIK on 27.11.2023.
//
//
//import XCTest
//@testable import MovieBoxAPI
//@testable import MovieBox
//
//final class MovieBoxTests: XCTestCase {
//
//    private var service: MockService!
//    var view: MockMovieListView!
//    var controller: MovieListViewController!
//
//    override func setUp() {
//
//        service = MockService()
//        view = MockMovieListView()
//        controller = MovieListViewController()
//
//        controller.customView = view
//        controller.service = service
//    }
//
//
//    func testMovieList() throws {
//
//        //Given
//        let movie1 = try ResourceLoader.loadMovie(resource: .movie1)
//        service.movies = [movie1]
//
//        //When
//        controller.loadViewIfNeeded()
//
//        //Then
//        XCTAssertEqual(view.isLoadingValue, [true, false])
//        XCTAssertEqual(view.movieList?.count,  1)
//        XCTAssertEqual(view.movieList?[0].detail, movie1.artistName)
//
//    }
//
//}
//
//private final class MockService: TopMoviesServiceProtocol {
//
//    var movies: [Movie]?
//
//    func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void) {
//        completion(.success(TopMoviesResponse(results: movies!)))
//    }
//
//}
//
//
//final class MockMovieListView: MovieListViewProtocol {
//
//    var delegate: MovieBox.MovieListViewDelegate?
//    var movieList: [MoviePresentation]?
//    var isLoadingValue: [Bool] = []
//
//    func updateMovieList(_ movieList: [MovieBox.MoviePresentation]) {
//        self.movieList = movieList
//
//    }
//
//    func setLoading(_ show: Bool) {
//        isLoadingValue.append(show)
//
//    }
//
//
//
//}
