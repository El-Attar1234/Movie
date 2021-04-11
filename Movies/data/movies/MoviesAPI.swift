//
//  MovieAPI.swift
//  Movies
//
//  Created by Mahmoud Elattar on 4/9/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation


protocol MoviesAPIProtocol {
    func getMovies(completion: @escaping (Result<MovieResponse<Movie>?, NSError>) -> Void)
}


class MoviesAPI: BaseMovieApi<MovieNetworking> , MoviesAPIProtocol {
    func getMovies(completion: @escaping (Result<MovieResponse<Movie>?, NSError>) -> Void) {
        self.fetchData(target: .getMovies, responseClass:MovieResponse<Movie>.self) { (result) in
                  completion(result)
              }
    }
    
   
}
