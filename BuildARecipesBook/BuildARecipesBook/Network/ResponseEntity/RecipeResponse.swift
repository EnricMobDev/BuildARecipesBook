//
//  RecipeResponse.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import Foundation

struct RecipeResponse: Codable {
    let title: String
    let version: Double
    let href: String
    let results: [Recipe]
}

struct Recipe: Codable {
    let title: String
    let href: String
    let ingredients: String
    let thumbnail: String
}
