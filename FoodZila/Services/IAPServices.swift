//
//  IAPServices.swift
//  FoodZila
//
//  Created by javad faghih on 4/14/1399 AP.
//  Copyright © 1399 AP javad faghih. All rights reserved.
//

import Foundation
import StoreKit

protocol IAPServiceDelegate {
    func iapProductLoaded()
}


class IAPService: NSObject ,SKProductsRequestDelegate {
   
    static var instance = IAPService()
    
    var delegate: IAPServiceDelegate?
    
    var products = [SKProduct]()
    var productID = Set<String>()
    var productRequest = SKProductsRequest()
    
    
    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
    
    
    
    func loadProducts() {
         productIDtoStringSet()
        requestProducts(forIds: productID)
    }
    func productIDtoStringSet() {
        productID.insert(IAP_MEAL_ID)
        
    }
    func requestProducts(forIds ids: Set<String>) {
        productRequest.cancel()
        productRequest = SKProductsRequest(productIdentifiers: ids)
        productRequest.delegate = self
        productRequest.start()
    }
   
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
    
        if products.count == 0 {
            requestProducts(forIds: productID)
        } else {
            delegate?.iapProductLoaded()
            print(products[0])
        }
    }
       
    func attemptPurchaseForItemWith(productIndex: Product) {
        let product = products[productIndex.rawValue]
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
        
    }
    
    
}


extension IAPService: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
          switch  transaction.transactionState {
                
          case .purchased:
            SKPaymentQueue.default().finishTransaction(transaction)
            sendNotificationFor(status: .purchased, withIdentifier: transaction.payment.productIdentifier)
            debugPrint("purchased was successful")
          case .failed:
            SKPaymentQueue.default().finishTransaction(transaction)
            sendNotificationFor(status: .failed, withIdentifier: nil)
          case .restored:
            break
          case .deferred:
            break
          case .purchasing:
            break
          @unknown default:
            break
            }
            
        }
    }
    
    func sendNotificationFor(status: PurchaseStatus, withIdentifier identifier: String?) {
        
        switch status {
            
        case .purchased:
            NotificationCenter.default.post(name: NSNotification.Name.init(IAPServicePurchaseNotification), object: identifier)
        case .restored:
             NotificationCenter.default.post(name: NSNotification.Name.init(IAPServiceRestoreNotification), object: nil)
        case .failed:
            NotificationCenter.default.post(name: NSNotification.Name.init(IAPServiceFailureNotification), object: identifier)
        }
        
        
        
    }
    
    
}
