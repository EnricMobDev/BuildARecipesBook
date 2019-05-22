//
//  ListOfRecipesPresenter.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright (c) 2019 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class ListOfRecipesPresenter: NSObject, ListOfRecipesViewToPresenterProtocol, UICollectionViewDataSource, UICollectionViewDelegate, SearchRecipesProtocol {
    
    // MARK: - Variables
    var view: ListOfRecipesPresenterToViewProtocol?
    var interactor: ListOfRecipesPresenterToInteractorProtocol?
    var router: ListOfRecipesPresenterToRouterProtocol?
    
    var createRecipeCollection: [DetailDrawerItemProtocol] = []
    
    // MARK: - Lifecycle
    func updateView() {
        interactor?.fetchRecipes()
        view?.recipeCollectionView.dataSource = self
        view?.recipeCollectionView.delegate = self
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return createRecipeCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = createRecipeCollection[indexPath.row]
        let drawer = item.collectionDrawer
        
        let collection = drawer.collectionView(collectionView, didSelectItemAt: indexPath)
        
        drawer.drawCollection(collection, withItem: item)
        
        return collection
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let collection = createRecipeCollection[indexPath.item] as? ListOfRecipesModels
        
        guard let detailUrl = collection?.href else { return }
        openExternal(url: detailUrl)
    }
    
    // MARK: - Private functions
    func openExternal(url: String) {
        if let externalUrl = URL(string: url) {
            UIApplication.shared.open(externalUrl)
        }
    }
    
    // MARK: - SearchRecipesProtocol
    func searchRecipes(withText: String) {
       print(withText)
    }
}

// MARK: - ListOfRecipesInteractorToPresenterProtocol
extension ListOfRecipesPresenter: ListOfRecipesInteractorToPresenterProtocol {
    
    func listOfRecipes(recipes: ListOfRecipesModel) {
        
        view?.stopSpinner()
        
        for eachRecipe in recipes.results {
            createRecipeCollection.append(ListOfRecipesModels(recipeImage: eachRecipe.thumbnail, nameOfRecipe: eachRecipe.title, ingredients: eachRecipe.ingredients, href: eachRecipe.href, delegate: self as? MakeAFavouriteButtonProtocol))
        }
        view?.recipeCollectionView.reloadData()
    }

    func errorFechingRecipes(error: Error) {
        
    }
}
