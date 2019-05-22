//
//  SearchBoxView.swift
//  BuildARecipesBook
//
//  Created by Enric Pou Villanueva on 17/05/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import UIKit

protocol SearchRecipesProtocol {
    func searchRecipes(withText: String)
}

class SearchBoxView: UIView {

    // MARK: - Variables
    var delegate: SearchRecipesProtocol?
    var nibName = String(describing: SearchBoxView.self)

    // MARK: - Constants
    let CORNER_RADIUS: CGFloat = 8
    
    // MARK: - IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var recipesSearchTextField: UITextField!
    
    // MARK: - Lifecycle
    override open func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
        updateView()
    }
    
    private func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }
    
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
    
    // MARK: - Private methods
    func updateView() {
        backgroundView.layer.cornerRadius = CORNER_RADIUS
    }
    
    // MARK: - IBActions
    @IBAction func magnifyingGlassButton(_ sender: Any) {
        
        guard let userText = recipesSearchTextField.text else { return }
        delegate?.searchRecipes(withText: userText)
    }
    
}
