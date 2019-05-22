//
//  APIClient.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    enum APIError: Error {
        case incorrectParameters
        case jsonConversion
        case emptyResults
        case failedPostCall
    }
    
    enum ResponseType: String {
        case json
    }
    
    private static var Manager: Alamofire.SessionManager = {
        var serverTrustPolicies: [String: ServerTrustPolicy] = [:]
        serverTrustPolicies = ["recipepuppy.com/api": .disableEvaluation]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        let manager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default,
                                               serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        return manager
    }()
    
    static func performRequest<T: Decodable>(type: ResponseType, serviceRouter: APIRouter, decoder: JSONDecoder, dto: T.Type, completion: @escaping (Alamofire.Result<T>) -> Void) {
        
        let manager = Manager

        switch type {
        case .json:
            
            manager.request(serviceRouter).responseJSON { (response) in
                
                switch response.result {
                case .success:
                    do {
                        let jsonDecoder = JSONDecoder()
                        guard let secureData = response.data else { return }
                        let dtoObject = try jsonDecoder.decode(dto.self, from: secureData )
                        
                        completion(Alamofire.Result.success(dtoObject))
                        
                    } catch _ {
                        completion(Alamofire.Result.failure(APIError.jsonConversion))
                    }
                    
                case .failure:
                    completion(Alamofire.Result.failure(APIError.failedPostCall))
                }
            }
        }
    }
}
