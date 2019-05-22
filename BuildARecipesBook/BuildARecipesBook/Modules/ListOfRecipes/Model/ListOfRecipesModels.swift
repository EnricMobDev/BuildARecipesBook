//
//  ListOfRecipesModels.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import UIKit

struct ListOfRecipesModels {
    
    var recipeImage: String
    var nameOfRecipe: String
    var ingredients: String
    var href: String
    var delegate: MakeAFavouriteButtonProtocol?
}
