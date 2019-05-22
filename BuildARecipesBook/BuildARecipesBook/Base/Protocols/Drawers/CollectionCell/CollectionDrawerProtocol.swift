//
//  CollectionDrawerProtocol.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import UIKit

internal protocol CollectionDrawerProtocol {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    func drawCollection(_ collectionView: UICollectionViewCell, withItem item: Any)
}
