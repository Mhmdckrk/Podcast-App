//
//  MovieDetailBuilder.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 2.12.2023.
//

import MovieBoxAPI
import UIKit

final class MovieDetailBuilder {
    
    static func make(with viewModel: MovieDetailViewModelProtocol) -> MovieDetailViewController {
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MovieDetailViewController") as! MovieDetailViewController
        viewController.viewModel = viewModel
        return viewController
        
    }
    
}
