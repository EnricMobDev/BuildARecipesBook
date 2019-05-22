//
//  ListOfRecipesDrawer.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

internal final class ListOfRecipesDrawer: CollectionDrawerProtocol {
    
    let CORNER_RADIUS: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionView.register(UINib(nibName: RecipeCollectionViewCell.getCollectionIdentifier(), bundle: nil), forCellWithReuseIdentifier: RecipeCollectionViewCell.getCollectionIdentifier())
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.getCollectionIdentifier(), for: indexPath)
    }
    
    func drawCollection(_ collectionView: UICollectionViewCell, withItem item: Any){
        
        guard let cell = collectionView as? RecipeCollectionViewCell,
            let item = item as? ListOfRecipesModels else { return }
        
        let imageURL = convertStringTo(image: item.recipeImage)
        
        cell.contentImageView.layer.cornerRadius = CORNER_RADIUS
        cell.recipeImage.kf.setImage(with: imageURL)
        cell.nameOfRecipe.text = item.nameOfRecipe
        cell.ingredients.text = item.ingredients
        cell.delegate = item.delegate        
    }
    
    func convertStringTo(image: String)  -> URL? {
        guard let imageURL = URL(string: image) else { return nil}
        return imageURL
    }
}

// MARK: DetailDrawerItemProtocol
extension ListOfRecipesModels: DetailDrawerItemProtocol {
    
    var collectionDrawer: CollectionDrawerProtocol {
        return ListOfRecipesDrawer()
    }
}
