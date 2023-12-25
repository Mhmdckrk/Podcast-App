
//  MovieListBuilder.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 29.11.2023.


import UIKit

final class MovieListBuilder {

    static func make() -> MovieListViewController {
        let storyboard = UIStoryboard(name: "MovieList", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MovieListViewController") as! MovieListViewController
        // aslında bu şekilde olmuyor git storyboarddan yükle diyoruz. o kendisi buluyor viewcontroller'ı vs. bu konu helper'da incelenecek.
        viewController.viewModel = MovieListViewModel(service: app.service)
        // viewmodel injection  yaptık. servisi te viewmodele inject ettik.
        return viewController
    }

}
