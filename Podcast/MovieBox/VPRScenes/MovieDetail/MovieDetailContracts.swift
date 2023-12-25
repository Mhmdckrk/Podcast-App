//
//  MovieDetailContracts.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 4.12.2023.
//

import UIKit

protocol MovieDetailPresenterProtocol {
    func load()
}

protocol MovieDetailViewProtocol: AnyObject {
    func update(_ presentation: MovieDetailPresentation)
}
