//
//  TopMovieResponse.swift
//  MovieBoxAPI
//
//  Created by Mahmud CIKRIK on 22.11.2023.
//

import Foundation

public struct TopMoviesResponse: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case feed
    }
    
    private enum FeedCodingKeys: String, CodingKey {
        case results
    }
    
    public let results: [Movie]
    
    init(results: [Movie]) {
        self.results = results
    }

    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let feedContainer = try rootContainer.nestedContainer(keyedBy: FeedCodingKeys.self, forKey: .feed)
        self.results = try feedContainer.decode([Movie].self, forKey: .results)
    }
    
}
