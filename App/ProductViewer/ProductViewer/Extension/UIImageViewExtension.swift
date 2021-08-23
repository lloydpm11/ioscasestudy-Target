//
//  UIImage+Extension.swift
//  ProductViewer
//
//  Created by Lloyd on 22/08/21.
//  Copyright © 2021 Target. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func setImage(for url: URL?, placeHolderImage: UIImage? = nil) {
        if let imageUrl = url {
            af.setImage(withURL: imageUrl, placeholderImage: placeHolderImage)
        } else {
            image = placeHolderImage
        }
    }
}
