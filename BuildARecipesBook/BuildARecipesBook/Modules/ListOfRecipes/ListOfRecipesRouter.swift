//
//  ListOfRecipesRouter.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright (c) 2019 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class ListOfRecipesRouter: ListOfRecipesPresenterToRouterProtocol{
    
    class func createModule() -> UIViewController{
        let view = ListOfRecipesViewController()
        let presenter: ListOfRecipesViewToPresenterProtocol & ListOfRecipesInteractorToPresenterProtocol = ListOfRecipesPresenter()
        let interactor: ListOfRecipesPresenterToInteractorProtocol = ListOfRecipesInteractor()
        let router: ListOfRecipesPresenterToRouterProtocol = ListOfRecipesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
