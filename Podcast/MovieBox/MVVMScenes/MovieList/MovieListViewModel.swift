//
//  MovieListViewModel.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 29.11.2023.
//

import Foundation
import MovieBoxAPI

final class MovieListViewModel: MovieListViewModelProtocol {
    
    weak var delegate: MovieListViewModelDelegate?
    private let service: TopMoviesServiceProtocol
    private var movies: [Movie] = []
    
    init(service: TopMoviesServiceProtocol) {
        self.service = service
        
    }
    
    func load() {
        notify(.updateTitle("Movies"))
        notify(.setLoading(true))
        
        service.fetchTopMovies { [weak self] result in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            switch result {
            case .success(let response):
                self.movies = response.results
                let presentations = response.results.map({ MoviePresentation(movie: $0) })
                self.notify(.showMovieList(presentations))
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func selectMovie(at index: Int) {
        let movie = movies[index]
        let viewModel = MovieDetailViewModel(movie: movie)
        delegate?.navigate(to: .detail(viewModel))
    }
    
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
    
}
