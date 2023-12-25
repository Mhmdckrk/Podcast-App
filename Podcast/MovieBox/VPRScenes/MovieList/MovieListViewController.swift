//
//  MovieListViewController.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 3.12.2023.
//

import UIKit

final class MovieListViewController: UIViewController, MovieListViewProtocol {

    
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var movies: [MoviePresentation] = []
    var presenter: MovieListPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        presenter.load()
        
    }
    
    func handleOutput(_ output: MovieListPresenterOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isShowed):
                    activityIndicator.layer.zPosition = 5
                    activityIndicator.backgroundColor = .systemBackground
                    if isShowed {
                        activityIndicator.startAnimating()
                    } else {
                        UIView.animate(withDuration: 0.8, animations: {
                            self.activityIndicator.alpha = 0.0
                            self.activityIndicator.layer.opacity = 0.0
                        }) { complete in
                            self.activityIndicator.stopAnimating()
                            self.activityIndicator.hidesWhenStopped = true
                        }
                    }
        case .showMovieList(let movies):
            self.movies = movies
            tableView.reloadData()
        }
    }
    
}

extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.detail
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
}

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter.selectMovie(at: indexPath.row)
    }
    
}
