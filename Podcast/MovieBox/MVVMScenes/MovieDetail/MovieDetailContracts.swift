//
//  MovieDetailContracts.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 2.12.2023.
//

import Foundation

protocol MovieDetailViewModelDelegate: AnyObject {
    
    func showDetail(_ presentation: MovieDetailPresentation)
    
}

protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? { get set }
    func load()
}
