//
//  KingFisher-Extension.swift
//  TV_Show
//
//  Created by 郑娇鸿 on 17/3/4.
//  Copyright © 2017年 郑娇鸿. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(_ URLString : String?, _ placeHolderName : String?) {
        guard let URLString = URLString else {
            return
        }
        
        guard let placeHolderName = placeHolderName else {
            return
        }
        
        guard let url = URL(string: URLString) else { return }
        kf.setImage(with: url, placeholder : UIImage(named: placeHolderName))
    }
}
