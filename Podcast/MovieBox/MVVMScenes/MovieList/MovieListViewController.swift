//
//  MovieListViewController.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 24.11.2023.
//

import UIKit

final class MovieListViewController: UIViewController {
       
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

//    viewConroller oluşturulacak, viewmodel enject edecek. delegeyi kendimize alacakğız. Didload çağırılınca viewmodel load yüklenecek. yüklenince view'ı update edeceğiz.
    
    var viewModel: MovieListViewModelProtocol! {
        didSet {
            viewModel.delegate = self // delegeyi kendine aldın demek oluyor. yetki viewmodel'da
        }
        
    }
    
    private var movieList: [MoviePresentation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.load()

    }
}

extension MovieListViewController: MovieListViewModelDelegate {
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
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
        case .showMovieList(let movieList):
            self.movieList = movieList
            tableView.reloadData()
        }
    }
    
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .detail(let viewModel):
            let viewController = MovieDetailBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
    
}

extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath)
        let movie = movieList[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.detail
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
}

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.selectMovie(at: indexPath.row)
    }
    
}
