//
//  MovieDetailViewController.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 2.12.2023.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    var viewModel: MovieDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
    
}

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func showDetail(_ presentation: MovieDetailPresentation) {
        titleLabel.text = presentation.title
        detailLabel.text = presentation.artistName
        genreLabel.text = presentation.genre
    }
    
}
