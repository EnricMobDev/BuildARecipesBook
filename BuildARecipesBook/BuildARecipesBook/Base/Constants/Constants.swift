//
//  Constants.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Networking {
        struct Url {
            static let base_url = "http://www.recipepuppy.com/api/"
        }
    }
    
    struct NameOfImages {
        static let start_ok = "star_ok"
        static let start_ko = "star_ko"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
