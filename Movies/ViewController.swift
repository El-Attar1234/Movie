//
//  ViewController.swift
//  Movies
//
//  Created by Mahmoud Elattar on 4/8/21.
//  Copyright © 2021 ITI. All rights reserved.
//


//https://api.androidhive.info/json/movies.json

import UIKit
import Alamofire
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = MoviesAPI()
        api.getMovies { (result) in
                  switch result {
                  case .success(let response):
                    guard let movies = response?.results else {
                                         return
                                     }
                     for movie in movies{
                        print("movie name->\(movie.title ?? ""),popularity->\(movie.popularity ?? 8.8),Vote->\(movie.vote_average ?? 8.8)")
                    }
                   
                  case .failure(let error):
                      print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                      print(error.code)
                  }
              }
       /* fetchData{
            (response) in
            switch response {
            case .success(let movie):
                guard let movie = movie else {
                    return
                }
                print("movie name->\(movie.movieName!) companies \(movie.companies?[0].name ?? "")")
            default:
                print("faiulre")
            }
          
        }*/
        
    
        
    }
   /* func fetchData(completion : @escaping (Result<Movie?,NSError>) -> Void) {
        AF.request("https://api.themoviedb.org/3/movie/550",method: .get,parameters: ["api_key":"390f97cef8e392bf72812b1730df0073"]).responseJSON{response in
            guard let code = response.response?.statusCode else{return}
            if code == 200{
                guard let responseData=try?response.result.get()  else{return}
                guard let reponseJson=try?JSONSerialization.data(withJSONObject: responseData, options: []) else {
                    return
                }
                guard let jsonObject=try?JSONDecoder().decode(Movie.self,from: reponseJson)else{return}
                completion(.success(jsonObject))
            }
            
        }
    }*/

    
    
    func fetchData<T : Decodable>(url:String,responseClass:T.Type, completion : @escaping (Result<T?,NSError>) -> Void) {
          AF.request(url,method: .get,parameters: ["api_key":"390f97cef8e392bf72812b1730df0073"]).responseJSON{response in
              guard let code = response.response?.statusCode else{return}
              if code == 200{
                  guard let responseData=try?response.result.get()  else{return}
                  guard let reponseJson=try?JSONSerialization.data(withJSONObject: responseData, options: []) else {
                      return
                  }
                guard let jsonObject=try?JSONDecoder().decode(T.self,from: reponseJson)else{return}
                  completion(.success(jsonObject))
              }
              
          }
      }
    
    
    
    
    }
/*
class Movie :Decodable{
    var movieName:String?
    var companies:[Company]?
   
      enum CodingKeys : String , CodingKey{
          case movieName = "original_title"
          case companies = "production_companies"
          
      }
}

class Company:Decodable{
    var id:Int?
    var logo_path:String?
    var name:String?
    var origin_country:String?
    
}*/
