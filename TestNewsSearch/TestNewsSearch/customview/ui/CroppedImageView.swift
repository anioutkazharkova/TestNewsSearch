//
//  CroppedImageView.swift
//  TestNewsSearch
//
//  Created by 1 on 14.02.2020.
//  Copyright © 2020 azharkova. All rights reserved.
//

import Foundation
import UIKit

class CroppedImageView : UIImageView {
    override var image: UIImage? {
        get {
            return super.image
        }
        
        set {
            self.setNeedsLayout()
            self.layoutIfNeeded()
            super.image = newValue?.crop(to: self.bounds.size)
        }
    }
}
