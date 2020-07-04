//
//  MainCell.swift
//  FoodZila
//
//  Created by javad faghih on 4/11/1399 AP.
//  Copyright © 1399 AP javad faghih. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImgView: UIImageView!
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var foodPriceLbl: UILabel!
    
    
    func configureCell(food: Items) {
        
        foodImgView.image = food.image
        foodNameLbl.text = food.name
        foodPriceLbl.text = "\(food.price)"
        
        
    }
    
    
}
