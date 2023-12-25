//
//  MockTopMoviesService.swift
//  MovieBoxMVVMTests
//
//  Created by Mahmud CIKRIK on 29.11.2023.
//

import Foundation
@testable import MovieBoxAPI

final class MockTopMoviesService: TopMoviesServiceProtocol {

    var movies: [Movie]?

    func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void) {
        completion(.success(TopMoviesResponse(results: movies!)))
    }

}


