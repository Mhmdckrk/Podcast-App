//
//  MovieListContracts.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 29.11.2023.
//

import Foundation

protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    func load()
    func selectMovie(at index: Int)
    
}

enum MovieListViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([MoviePresentation])
//    case showMovie(String)
    
}

enum MovieListViewRoute {
    case detail(MovieDetailViewModelProtocol)
    
}

protocol MovieListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
    func navigate(to route: MovieListViewRoute)
    
}


