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
        fetchData()
    }
    
    func fetchData() {
        AF.request("http://httpbin.org/get").response { response in
            //debugPrint(response)
           
        }
    }


}

