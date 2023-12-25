//
//  MVVMAppContainer.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 29.11.2023.
//

import Foundation
import MovieBoxAPI

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = TopMoviesService()
     
}
