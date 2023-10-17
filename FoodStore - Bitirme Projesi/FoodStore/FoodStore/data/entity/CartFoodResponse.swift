//
//  SepettekiYemeklerResponse.swift
//  FoodStore
//
//  Created by Musti on 6.10.2023.
//

import Foundation


class CartFoodResponse : Codable {
    var success:Int?
    var sepet_yemekler:[CartFoodModel]?
}
