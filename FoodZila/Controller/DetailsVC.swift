//
//  DetailsVC.swift
//  FoodZila
//
//  Created by javad faghih on 4/11/1399 AP.
//  Copyright © 1399 AP javad faghih. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var itemPriceLbl: UILabel!
    @IBOutlet weak var uglyAdView: UIView!
    @IBOutlet weak var buyItemsBtn: UIButton!
    @IBOutlet weak var hideAdsBtn: UIButton!
    
    var items: Items!
    
    func initData(data: Items) {
        items = data
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        itemImageView.image = items.image
        itemNameLbl.text = items.name
        itemPriceLbl.text = "\(items.price)"
        
       
    }
    

   
    @IBAction func closeBtnWasPressed(_ sender: UIButton) {
   
    dismiss(animated: true, completion: nil)
    }
    
}
