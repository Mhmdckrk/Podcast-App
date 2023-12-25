//
//  MovieListPresenter.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 3.12.2023.
//

import Foundation

final class MovieListPresenter: MovieListPresenterProtocol {
    
    // etkileşimde olacağı bütün protocolleri alıyoruz.
    private unowned let view: MovieListViewProtocol
    private let interactor: MovieListInteractorProtocol
    private let router: MovieListRouterProtocol
    
    // unowned nedir? galiba nil olmamakla ilgili birşeydi.
    // unowned oldupu için let yapabilirsin
    
    // outputu gönderdiğimiz değişkene burada view dedik interactor'da delegate dedik. var output'a diyebilirdik. Ama bir presenter view'dan başka birşeyle konuşmadığı için gerek kalmadı.
    
    init(view: MovieListViewProtocol, interactor: MovieListInteractorProtocol, router: MovieListRouterProtocol) {
        self.view = view //injection
        self.interactor = interactor //injection
        self.router = router //injection
        
        self.interactor.delegate = self
    }
    
    func load() {
        //Update title
        view.handleOutput(.updateTitle("Movies"))
        //Load movies
        interactor.load()
    }
    
    func selectMovie(at index: Int) {
        interactor.selectMovie(at: index)
    }
    
}

extension MovieListPresenter: MovieListInteractorDelegate {
    
    func handleOutput(_ output: MovieListInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view.handleOutput(.setLoading(isLoading))
        case .showMovieList(let movies):
            let moviePresentations = movies.map(MoviePresentation.init)
            view.handleOutput(.showMovieList(moviePresentations))
        case .showMovieDetail(let movie):
            router.navigate(to: .detail(movie))
        }
    }
    
}

// Unit test değil interaction test
