//
//  Nib.swift
//  iMusic
//
//  Created by Александр Прайд on 05.09.2020.
//  Copyright © 2020 Alexander Pride. All rights reserved.
//

import UIKit

extension UIView {
    
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
