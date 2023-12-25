//
//  DetailViewModel.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 2.12.2023.
//

import Foundation
import MovieBoxAPI

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    weak var delegate: MovieDetailViewModelDelegate?
    private let presentation: MovieDetailPresentation
    
    init(movie: Movie) {
        self.presentation = MovieDetailPresentation(movie: movie)
    }
    
    func load() {
        delegate?.showDetail(presentation)
    }
    
    
}
