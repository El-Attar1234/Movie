//
//  RemoteDataSource.swift
//  Movies
//
//  Created by Mahmoud Elattar on 5/2/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation


protocol RemoteDataSourceProtocol {
    func getMovies(completion: @escaping (Result<MovieResponse<Movie>?, NSError>) -> Void)
}


class RemoteDataSource: BaseMovieApi<RemoteDataSourceWrapper> , RemoteDataSourceProtocol {
    func getMovies(completion: @escaping (Result<MovieResponse<Movie>?, NSError>) -> Void) {
        self.fetchData(target: .getMovies, responseClass:MovieResponse<Movie>.self) { (result) in
                  completion(result)
              }
    }
    
   
}
