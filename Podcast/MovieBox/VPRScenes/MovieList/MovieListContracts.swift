//
//  MovieListContracts.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 3.12.2023.
//

import Foundation
import struct MovieBoxAPI.Movie

// MARK: - Interactor
// Interactor katmanı işlerin yapıldığı yerdir. Bunu encapsule bir şekilde presenter'dan soyutlayarak burada yapıyoruz ki böylece platfromlar değiştiğinde presenter değişse bile iş değişmemiş olacak.
// Burada işlem tekrarı oluyor yani presenter aynı işlem adıyla Interactor'a taşımış oluyor.

protocol MovieListInteractorProtocol: AnyObject {
    // AnyObject diyoruz çünkü bunlar referenace type bunların struct olmasını istemiyoruz.
    var delegate: MovieListInteractorDelegate? { get set }
    func load()
    func selectMovie(at index: Int)
}

enum MovieListInteractorOutput: Equatable {
    
    case setLoading(Bool)
    case showMovieList([Movie])
    case showMovieDetail(Movie)
}

protocol MovieListInteractorDelegate: AnyObject {
    func handleOutput(_ output: MovieListInteractorOutput)
}

// MARK: - Presenter

protocol MovieListPresenterProtocol: AnyObject {
//presenter inputs:
    func load()
    func selectMovie(at index: Int)
}

// Presenter katmanındayız Movie göndermiyoruz. MoviePresentation gönderiyoruz. Bu outputları View'a gönderiyor olacağız.
enum MovieListPresenterOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([MoviePresentation])
}


// MARK: - View

// View Presenter'a load() işlemini yap diyecek(notify). Presenter'dan outputlar dönecek. Bu outputları handle etmemiz gerekecek.

protocol MovieListViewProtocol: AnyObject {
    func handleOutput(_ output: MovieListPresenterOutput)
}

// MARK: - Router

enum MovieListRoute: Equatable {
    case detail(Movie)
    // Router bunu Presenter'dan alacak. Bunu Interactora gönderecek hangi movie aldığı öürenip geri gelip basacak.
}

protocol MovieListRouterProtocol: AnyObject {
    // Anyobject yapıyoruz structan koruyoruz çünkü tüm viper entity hariç yaşayan objeler.
    func navigate(to route: MovieListRoute )
    
}
