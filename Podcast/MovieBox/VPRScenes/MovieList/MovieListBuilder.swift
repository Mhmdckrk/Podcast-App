
//  MovieListBuilder.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 29.11.2023.


import UIKit

final class MovieListBuilder {
// Builder: MovieList sayfasını oluşuracak component
    
    static func make() -> MovieListViewController {
        let storyboard = UIStoryboard(name: "MovieList", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "MovieListViewController") as! MovieListViewController
        let router = MovieListRouter(view: view)
        let interactor = MovieListInteractor(service: app.service)
        let presenter = MovieListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        return view
    }

}
