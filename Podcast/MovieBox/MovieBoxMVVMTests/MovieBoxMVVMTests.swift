//
//  MovieBoxMVVMTests.swift
//  MovieBoxMVVMTests
//
//  Created by Mahmud CIKRIK on 29.11.2023.
//

import XCTest
@testable import MovieBox
@testable import MovieBoxAPI

final class MovieBoxMVVMTests: XCTestCase {

    private var view: MockView!
    private var viewModel: MovieListViewModel!
    private var service: MockTopMoviesService!
    
    override func setUp() {
        
        service = MockTopMoviesService()
        viewModel = MovieListViewModel(service: service)
        view = MockView()
        viewModel.delegate = view
        
    }

    func testLoad() throws {
        
        //Given:
        let movie1 = try ResourceLoader.loadMovie(resource: .movie1)
        let movie2 = try ResourceLoader.loadMovie(resource: .movie2)
        // servisi çağırdığımız zaman bu ikisi dönecek
        service.movies = [movie1, movie2]
//        print("TESTTTTTT \(service.movies)")
        
        //When:
        viewModel.load()
   
        
        //Then:
        
        XCTAssertEqual(view.outputs.count, 4)
        
        switch try view.outputs.element(at: 0) {
        case .updateTitle(_):
            break // Sucess!
        default:
            XCTFail("First output should be 'updateTitle'.")
        }

        XCTAssertEqual(try view.outputs.element(at: 1), .setLoading(true))
        XCTAssertEqual(try view.outputs.element(at: 2), .setLoading(false))
        let expectedMovies = [movie1, movie2].map({ MoviePresentation(movie: $0) })
        XCTAssertEqual(try view.outputs.element(at: 3), .showMovieList(expectedMovies))
        
        
    }
    
    func testNavigation() throws {
        //Given
        let movie1 = try ResourceLoader.loadMovie(resource: .movie1)
        let movie2 = try ResourceLoader.loadMovie(resource: .movie2)
        // servisi çağırdığımız zaman bu ikisi dönecek
        service.movies = [movie1, movie2]
        viewModel.load()
        view.reset()
        
        //When
        viewModel.selectMovie(at: 0)
        
        //Then
        XCTAssertTrue(view.detailRouteCalled)
        
    }
 

}

private class MockView: MovieListViewModelDelegate {
    
    var detailRouteCalled: Bool = false
    
    func reset() {
        outputs.removeAll()
        detailRouteCalled = false
        
    }
    
    func navigate(to route: MovieBox.MovieListViewRoute) {
        switch route {
        case .detail:
            detailRouteCalled = true
            
        }
    }
    
    
    var outputs: [MovieListViewModelOutput] = []
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        outputs.append(output)
    }
    
}
