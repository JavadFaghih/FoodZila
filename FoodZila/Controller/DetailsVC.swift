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
        
       
      NotificationCenter.default.addObserver(self, selector: #selector(handlePurchase(_:)), name: NSNotification.Name(IAPServicePurchaseNotification), object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(handleFailure), name: NSNotification.Name(IAPServiceFailureNotification), object: nil)
       
   }
   
   override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       
       NotificationCenter.default.removeObserver(self)
   }
   
   @objc func handlePurchase(_ notification: Notification) {
       guard let productID = notification.object as? String else { return }
           
       switch productID {
       case IAP_MEAL_ID:
        
        debugPrint("meal successfuly purchassed.")
       case IAP_HIDE_ADS_ID:
           break
       default:
           break
       }
        }
     @objc func handleFailure() {

           print("purchassed Failed")
       
       
   }
   

   
    @IBAction func closeBtnWasPressed(_ sender: UIButton) {
   
    dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buyBtnWasPressed(_ sender: UIButton) {
       buyItemsBtn.isEnabled = false

        IAPService.instance.attemptPurchaseForItemWith(productIndex: .meal)
        
        
    }
}
