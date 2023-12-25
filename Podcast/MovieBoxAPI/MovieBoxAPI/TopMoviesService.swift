//
//  TopMoviesService.swift
//  MovieBoxAPI
//
//  Created by Mahmud CIKRIK on 22.11.2023.
//

import Foundation
import Alamofire

public protocol TopMoviesServiceProtocol {
    func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void)
}

public class TopMoviesService: TopMoviesServiceProtocol {
    
    public enum Error: Swift.Error {
        
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)

        
    }
    
    public init() {}
    
    public func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/podcasts/top/10/podcasts.json"
        
        
        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.plainDateDecoder
                do {
                    let response = try decoder.decode(TopMoviesResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))

            }
            
        }
        
    }
    
}
