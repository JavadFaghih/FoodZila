//
//  FoodItems.swift
//  FoodZila
//
//  Created by javad faghih on 4/11/1399 AP.
//  Copyright © 1399 AP javad faghih. All rights reserved.
//

import UIKit

let defaultPrice = 9.99

let salmon = Items(image: UIImage(named: "food1")!, name: "salmon", price: defaultPrice)
let cheeseBurger = Items(image: UIImage(named: "food2")!, name: "CheeseBurger", price: defaultPrice)
let burrito = Items(image: UIImage(named: "food3")!, name: "burrito", price: defaultPrice)
let spagetti = Items(image: UIImage(named: "food4")!, name: "spaggeti", price: defaultPrice)
let pizza = Items(image: UIImage(named: "food5")!, name: "pizza", price: defaultPrice)
let sallad = Items(image: UIImage(named: "food6")!, name: "sallad", price: defaultPrice)



let foodItems: [Items] = [salmon, cheeseBurger, burrito, spagetti, pizza, sallad]
