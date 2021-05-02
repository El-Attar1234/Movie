//
//  File.swift
//  Movies
//
//  Created by Mahmoud Elattar on 4/14/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewMode{
    var emailBehaviour=BehaviorRelay<String>(value: "")
     var passwordBehaviour=BehaviorRelay<String>(value: "")
    
    var isLoading=BehaviorRelay<Bool>(value: false)
 
    
    
    private var responseSubject=PublishSubject<(Result<MovieResponse<Movie>?, NSError>)>()
    //computed propert
    var responseObservable: Observable<(Result<MovieResponse<Movie>?, NSError>)>{
        return responseSubject
    }
    
    func getData(){
        isLoading.accept(true)
        let api = MoviesAPI()
              api.getMovies { [weak self] (result) in
                guard let self=self else{return}
                  self.isLoading.accept(false)
                        switch result {
                        case .success(let response):
                          guard let movies = response?.results else {
                                               return
                                           }
                        
                          //act as observale .....can hold data
                          self.responseSubject.onNext(result)
                          
                      print("movies---->\(movies)")
                           for _ in movies{
                            /*  print("movie name->\(movie.title ?? ""),popularity->\(movie.popularity ?? 8.8),Vote->\(movie.vote_average ?? 8.8)")*/
                          }
                         
                        case .failure(let error):
                            print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                            print(error.code)
                        }
                    }
        
        
        
        
    }
    
}
