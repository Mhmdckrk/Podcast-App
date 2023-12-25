//
//  Result.swift
//  MovieBoxAPI
//
//  Created by Mahmud CIKRIK on 22.11.2023.
//

import Foundation

public enum Result<Value> {
    
    case success(Value)
    case failure(Error)
    
}
