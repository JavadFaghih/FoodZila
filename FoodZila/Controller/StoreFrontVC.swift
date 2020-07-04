//
//  StoreFrontVC.swift
//  FoodZila
//
//  Created by javad faghih on 4/11/1399 AP.
//  Copyright © 1399 AP javad faghih. All rights reserved.
//

import UIKit

class StoreFrontVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        IAPService.instance.delegate = self
        IAPService.instance.loadProducts()
        
    }
    
    @IBAction func resoreBtnWasPressed(_ sender: Any) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as? ItemCell else { return UICollectionViewCell()}
        
        cell.configureCell(food: foodItems[indexPath.row])
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard  let detailVC = storyboard?.instantiateViewController(identifier: "detalisVC") as? DetailsVC else { return }
        
        detailVC.initData(data: foodItems[indexPath.row])
        
        present(detailVC, animated: true, completion: nil)
    }
    
}

extension StoreFrontVC: IAPServiceDelegate {
    func iapProductLoaded() {
        print("apple service was loaded")
    }
    
    
    
    
    
}
