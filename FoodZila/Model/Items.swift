//
//  Item.swift
//  FoodZila
//
//  Created by javad faghih on 4/11/1399 AP.
//  Copyright © 1399 AP javad faghih. All rights reserved.
//

import UIKit

class Items {
    
    public private(set) var image: UIImage
    public private(set)  var name: String
    public private(set)  var price: Double
    
    init(image: UIImage, name: String, price: Double) {
        self.image = image
        self.name = name
        self.price = price
    }
    
    
}



