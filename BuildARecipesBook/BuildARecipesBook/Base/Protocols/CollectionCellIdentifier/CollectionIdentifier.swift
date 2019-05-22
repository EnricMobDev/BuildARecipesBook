//
//  CollectionIdentifier.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import UIKit

protocol GetCollectionIdentifierProtocol {
    static func getCollectionIdentifier() -> String
}

extension GetCollectionIdentifierProtocol where Self: UICollectionViewCell {
    static func getCollectionIdentifier() -> String {
        return String(describing: self)
    }
}
