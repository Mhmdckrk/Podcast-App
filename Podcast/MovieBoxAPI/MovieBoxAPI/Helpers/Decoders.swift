//
//  Decoders.swift
//  MovieBoxAPI
//
//  Created by Mahmud CIKRIK on 21.11.2023.
//

import Foundation

public enum Decoders {
    
    public static let plainDateDecoder: JSONDecoder = {
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
    
}
