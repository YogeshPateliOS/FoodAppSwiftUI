//
//  APIResponse.swift
//  Yummie
//
//  Created by Yogesh Patel on 06/06/23.
//

import Foundation

struct APIResponse: Decodable {
    let status: Int
    let message: String
    let data: AllDishes?
}

struct AllDishes: Decodable {
    let categories: [DishCategory]
    let populars: [Dish]
    let specials: [Dish]
}

struct DishCategory: Decodable, Identifiable {
    let id, name, image: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}

struct Dish: Decodable, Identifiable {
    let id, name, description, image: String
    let calories: Int

    var formattedCalories: String {
        return "\(calories) calories"
    }
}

