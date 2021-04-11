//
//  MovieNetworking.swift
//  Movies
//
//  Created by Mahmoud Elattar on 4/9/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
import Alamofire

//api call methods
enum MovieNetworking {
    case getMovies
   
}

extension MovieNetworking: TargetType {
    var baseURL: String {
        switch self {
        case .getMovies:
            return Constants.BASE_URL
       
        }
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "/popular"
       
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMovies:
            return .get
      
        }
    }
    
    var task: Task {
        switch self {
        case .getMovies:
            return .requestParameters(parameters: ["api_key":"390f97cef8e392bf72812b1730df0073"], encoding:   URLEncoding.queryString)
        
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
