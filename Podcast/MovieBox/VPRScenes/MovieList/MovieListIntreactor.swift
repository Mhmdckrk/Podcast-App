//
//  MovieListIntreactor.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 3.12.2023.
//

import Foundation
import MovieBoxAPI

final class MovieListInteractor: MovieListInteractorProtocol {
    
    var delegate: MovieListInteractorDelegate?
    
    private let service: TopMoviesServiceProtocol
    private var movies: [Movie] = []
    
    init(service: TopMoviesServiceProtocol) {
        self.service = service
    }
    // yeri geldiğinde mock serice, app targetta ise gerçek servisi kullanabilmek için init hazırlıyoruz.
    
    func load() {
        delegate?.handleOutput(.setLoading(true))
        service.fetchTopMovies { [weak self] result in
            guard let self = self else { return }
            self.delegate?.handleOutput(.setLoading(false))
            
            switch result {
            case .success(let value):
                self.movies = value.results
                self.delegate?.handleOutput(.showMovieList(value.results))
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func selectMovie(at index: Int) {
        let movie = movies[index]
        delegate?.handleOutput(.showMovieDetail(movie))
        //indexteki movieyi alıp select movie çağırıldığı anda gönderdik.
    }
    
}
