//
//  MovieDetailBuilder.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 4.12.2023.
//x

import UIKit
import struct MovieBoxAPI.Movie

final class MovieDetailBuilder {
// Builder: MovieList sayfasını oluşuracak component
    
    static func make(with movie: Movie) -> MovieDetailViewController {
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "MovieDetailViewController") as!  MovieDetailViewController
        let presenter = MovieDetailPresenter(view: view, movie: movie)
        view.presenter = presenter
        
        return view
    }

}
