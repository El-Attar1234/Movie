//
//  RemoteDataSourceWrapper.swift
//  Movies
//
//  Created by Mahmoud Elattar on 5/2/21.
//  Copyright © 2021 ITI. All rights reserved.
//


import Foundation
import Alamofire

//api call methods
enum RemoteDataSourceWrapper {
    case getMovies
   
}

extension RemoteDataSourceWrapper: TargetType {
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
