//
//  MovieResponse.swift
//  Movies
//
//  Created by Mahmoud Elattar on 4/9/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation


struct MovieResponse<T : Codable>: Codable {
    // var page: Int?
    var results:[T]?
    enum CodingKeys : String , CodingKey{
        case results = "results"
        
    }
}
