//
//  APIRouter.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case listOfRecipes
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        
        switch self {
        case .listOfRecipes:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        
        switch self {
        case .listOfRecipes:
            return Constants.Networking.Url.base_url 
        }
    }
    
    //URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest: URLRequest
        
        switch self {
        case .listOfRecipes:
            let url = try path.asURL()
            urlRequest = URLRequest(url: url)
        }
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        return urlRequest
    }    
}
