//
//  ListOfRecipesProtocols.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright (c) 2019 Enric Pou Villanueva. All rights reserved.
//

import UIKit

protocol ListOfRecipesPresenterToViewProtocol: class{
    func stopSpinner()
    var recipeCollectionView: UICollectionView! {get set}
}

protocol ListOfRecipesInteractorToPresenterProtocol: class{
    func listOfRecipes(recipes: ListOfRecipesModel)
    func errorFechingRecipes(error: Error)
}

protocol ListOfRecipesPresenterToInteractorProtocol: class{
    var presenter: ListOfRecipesInteractorToPresenterProtocol? {get set}
    func fetchRecipes()
}

protocol ListOfRecipesViewToPresenterProtocol: class{
    var view: ListOfRecipesPresenterToViewProtocol? {get set}
    var interactor: ListOfRecipesPresenterToInteractorProtocol? {get set}
    var router: ListOfRecipesPresenterToRouterProtocol? {get set}
    func updateView()
    var createRecipeCollection: [DetailDrawerItemProtocol] {get set}
}

protocol ListOfRecipesPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
}
