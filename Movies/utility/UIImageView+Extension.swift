//
//  UIImageView+Extension.swift
//  Movies
//
//  Created by Mahmoud Elattar on 5/2/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView{
   func downloadImage(url:String){
        self.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "no-image"))
    }
  
}
