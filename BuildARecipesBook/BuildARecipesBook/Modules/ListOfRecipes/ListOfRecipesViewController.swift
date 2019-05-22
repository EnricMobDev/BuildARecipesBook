//
//  ListOfRecipesViewController.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright (c) 2019 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class ListOfRecipesViewController: UIViewController  {
    
    // MARK: - Variables
    var presenter: ListOfRecipesViewToPresenterProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var recipeCollectionView: UICollectionView!
    @IBOutlet weak var searchBoxView: SearchBoxView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
    }
}

// MARK: - ListOfRecipesPresenterToViewProtocol
extension ListOfRecipesViewController: ListOfRecipesPresenterToViewProtocol {
    
    func stopSpinner() {
    }
}
