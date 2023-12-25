//
//  MovieDetailPresenter.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 4.12.2023.
//

import Foundation
import struct MovieBoxAPI.Movie

final class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    unowned var view: MovieDetailViewProtocol
    private let movie: Movie
    
    init(view: MovieDetailViewProtocol, movie: Movie) {
        self.view = view
        self.movie = movie
    }
    
    func load() {
        view.update(MovieDetailPresentation(movie: movie))
    }
    
}
