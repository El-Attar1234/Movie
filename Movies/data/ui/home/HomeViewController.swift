//
//  HomeViewController.swift
//  Movies
//
//  Created by Mahmoud Elattar on 4/10/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var movies = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchBar
        
        let api = RemoteDataSource()
        api.getMovies { [weak self](result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                guard let movies = response?.results else {return}
                self.movies = movies
                DispatchQueue.main.async {
                    self.moviesCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                print(error.code)
            }
        }
        
        
        
    }
    
}
extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell
        guard let cell1 = cell else {return UICollectionViewCell()}
        cell1.set(for : movies[indexPath.item])
        return cell1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = view.frame.height
        let availableWidth = width - 3*10
        let availableHeight = height - 10
        return CGSize(width: availableWidth/2, height: availableHeight*0.3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10) // top, left, bottom, right
    }
    
    
}
