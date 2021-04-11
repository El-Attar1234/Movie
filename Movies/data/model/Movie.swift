//
//  Movie.swift
//  Movies
//
//  Created by Mahmoud Elattar on 4/9/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

class Movie :Codable{
    var title:String?
    var backdrop_path:String?
      var overview:String?
      var poster_path:String?
      var release_date:String?
      var vote_average:Float?
      var vote_count:Int?
      var genre_ids:[Int]?
      var id:Int?
      var popularity:Float?
     
   /*  enum CodingKeys : String , CodingKey{
          case title = "title"
         
          
      }*/
}

