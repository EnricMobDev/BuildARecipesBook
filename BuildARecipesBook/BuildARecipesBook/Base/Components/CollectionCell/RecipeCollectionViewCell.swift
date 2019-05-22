//
//  RecipeCollectionViewCell.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import UIKit

protocol MakeAFavouriteButtonProtocol {
    func makeFavoriteAction()
}

class RecipeCollectionViewCell: UICollectionViewCell, GetCollectionIdentifierProtocol {

    // MARK: - Delegate
    var delegate: MakeAFavouriteButtonProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var contentImageView: UIView!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var nameOfRecipe: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    @IBOutlet weak var makeAFavoriteButton: UIButton!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super .awakeFromNib()
        makeAFavoriteButton.setImage(UIImage(named: Constants.NameOfImages.start_ko), for: .normal)
        makeAFavoriteButton.setImage(UIImage(named: Constants.NameOfImages.start_ok), for: .selected)
    }
    
    // MARK: - IBAction
    @IBAction func favoriteButtonTapped(_ sender: Any) {

        makeAFavoriteButton.isSelected = (makeAFavoriteButton.isSelected) ? false : true
        
        delegate?.makeFavoriteAction()
    }
}
