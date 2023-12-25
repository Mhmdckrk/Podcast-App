//
//  MovieDetailController.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 4.12.2023.
//

import UIKit

final class MovieDetailViewController: UIViewController, MovieDetailViewProtocol {
    
    var presenter: MovieDetailPresenterProtocol!
    
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var artistNameLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
    
    func update(_ presentation: MovieDetailPresentation) {
        
        movieTitleLabel.text = presentation.title
        artistNameLabel.text = presentation.artistName
        genreLabel.text = presentation.genre
        
    }
    
}
