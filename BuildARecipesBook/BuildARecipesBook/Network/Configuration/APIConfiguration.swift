//
//  APIConfiguration.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: Alamofire.URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
}
