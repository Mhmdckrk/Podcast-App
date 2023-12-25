//
//  Movie.swift
//  MovieBoxAPI
//
//  Created by Mahmud CIKRIK on 21.11.2023.
//

import Foundation





//"results": [
//      {
//        "artistName": "Casefile Presents",
//        "id": "1713527997",
//        "name": "The Bakersfield Three",
//        "kind": "podcasts",
//        "contentAdvisoryRating": "Explict",
//        "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/2b/6f/fd/2b6ffde1-3d62-93d2-5cfc-d0b1c8a14fb2/mza_2795514163928995360.jpeg/100x100bb.png",
//        "genres": [
//          {
//            "genreId": "1488",
//            "name": "True Crime",
//            "url": "https://itunes.apple.com/us/genre/id1488"
//          },
//          {
//            "genreId": "1324",
//            "name": "Society \u0026 Culture",
//            "url": "https://itunes.apple.com/us/genre/id1324"
//          }
//        ],
//        "url": "https://podcasts.apple.com/us/podcast/the-bakersfield-three/id1713527997"
//      },

public struct Movie: Decodable, Equatable {
    
    public enum CodingKeys: String, CodingKey {
        
        case artistName
        case name
        case image = "artworkUrl100"
        case url
        case rating = "contentAdvisoryRating"
        case genres
    }
    
    public let artistName: String
    public let name: String
    public let image: URL
    public let url: URL
    public let rating: String?
    public let genres: [Genre]

}

public struct Genre: Decodable, Equatable {
    
    public let genreId: String?
    public let name: String?
    public let url: String?
    
}
