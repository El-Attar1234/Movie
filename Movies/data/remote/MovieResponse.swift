//
//  MovieResponse.swift
//  Movies
//
//  Created by Mahmoud Elattar on 4/9/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation


class MovieResponse<T : Codable>: Codable {
    var results:[T]?
    enum CodingKeys : String , CodingKey{
        case results = "results"
        
    }
}
