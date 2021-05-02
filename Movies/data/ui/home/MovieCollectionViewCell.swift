//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by Mahmoud Elattar on 4/10/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit
import Cosmos

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var ratingView: CosmosView!
    
    func set(for movie : Movie){
        guard let movieName = movie.title else {
            return
        }
        self.movieName.text = movieName
        guard let moviePoster = movie.backdropPath else {
            return
        }
        let imageURL = "\(Constants.BASE_IMAGE_URL)\(moviePoster)"
        self.movieImage.downloadImage(url:imageURL)
        ratingView.rating = movie.voteAverage * 0.5
    }
    
}
