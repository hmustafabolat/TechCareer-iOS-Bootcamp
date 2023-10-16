//
//  YemeklerResponse.swift
//  FoodStore
//
//  Created by Musti on 6.10.2023.
//

import Foundation

class FoodsResponse : Codable {
    var success : Int?
    var yemekler : [FoodsModel]?
}
