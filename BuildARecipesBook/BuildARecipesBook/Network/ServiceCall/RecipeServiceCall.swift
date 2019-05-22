//
//  RecipeServiceCall.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import Foundation

extension APIClient {
    
    static func listOfRecipes(completion: @escaping (RecipeResponse?, Error?) -> Void) {
        
        performRequest(type: .json, serviceRouter: APIRouter.listOfRecipes, decoder: JSONDecoder(), dto: RecipeResponse.self) { (response) in
            switch response {
            case .failure(let error):
                completion(nil, error)
            case .success(let data):
                completion(data, nil)
            }
        }
    }
}
