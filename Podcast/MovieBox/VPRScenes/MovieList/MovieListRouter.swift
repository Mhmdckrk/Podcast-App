//
//  MovieListRouter.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 3.12.2023.
//

import UIKit

final class MovieListRouter: MovieListRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: MovieListRoute) {
        switch route {
        case .detail(let movie):
            let detailView = MovieDetailBuilder.make(with: movie)
            view.show(detailView, sender: nil)
            
        }
        
    }
    
}
