//
//  TargetType.swift
//  Movies
//
//  Created by Mahmoud Elattar on 4/9/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
import Alamofire

enum HTTPMethod : String{
    case get="GET"
       case post="POST"
       case put="PUT"
       case delete="DELETE"
}


//wraper to identify the shape paramete
enum Task{
    case requestPlain
    case requestParameters(parameters:[String:String] , encoding:ParameterEncoding)
}
//most important and we use it every where
//hold propeties of our request
//we use it to call with api functions
 
protocol TargetType {
    
    /// The target's base `URL`.
    var baseURL: String { get }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }
    
    /// The HTTP method used in the request.
    var method: HTTPMethod { get }
    
    /// The type of HTTP task to be performed.
    var task: Task { get }
    
    /// The headers to be used in the request.(authorization or token)
    var headers: [String: String]? { get }
}
