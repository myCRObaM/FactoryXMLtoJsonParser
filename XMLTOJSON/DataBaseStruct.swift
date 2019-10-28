//
//  DataBaseStruct.swift
//  xmlParser
//
//  Created by Matej Hetzel on 23/10/2019.
//  Copyright © 2019 Matej Hetzel. All rights reserved.
//

import Foundation

struct Restorani: Encodable {
    var name: String
    var tel: String?
    var mob: String?
    var workingHours: String?
    var meals: MealTypes
}
struct Meals: Encodable {
    var name: String
    var priceNormal: String?
    var priceJumbo: String?
    var price: String?
    var ingredients: [Ingredients]?
}

struct Ingredients: Encodable {
    var name: String?
}

struct MealTypes: Encodable {
    var desert: [Meals]?
    var dodaci: [Meals]?
    var hamburgeri: [Meals]?
    var jelaPoNarudzbi: [Meals]?
    var jelaSRostilja: [Meals]?
    var kebabRazno: [Meals]?
    var Ostalo: [Meals]?
    var pizze: [Meals]?
    var prilozi: [Meals]?
    var ribljaJela: [Meals]?
    var rizoto: [Meals]?
    var salate: [Meals]?
    var sendvici: [Meals]?
    var tjestenine: [Meals]?
}
