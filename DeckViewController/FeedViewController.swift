//
//  FeedViewController.swift
//  DeckViewController
//
//  Created by Peter Nicholls on 8/10/2015.
//  Copyright © 2015 Peter Nicholls. All rights reserved.
//

import Foundation
import UIKit

class FeedViewController: DeckViewController {
    
    // MARK: - Internal Properties
    
    // MARK: - Private Properties
    
    // MARK: - Initalizers
    
    // MARK: - UIViewController
    
    override init() {
        super.init()
        
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal Methods
 
    override func numberOfCardsInDeckViewController(deckView: DeckViewController) -> Int {
        return 1
    }
    
    override func deckViewController(deckViewController: DeckViewController, viewControllerForCardAtIndex index: Int) -> UIViewController {
        let viewController = CardViewController()
        
        switch (index) {
        case 0:
            viewController.view.backgroundColor = .purpleColor()
        case 1:
            viewController.view.backgroundColor = .brownColor()
        default:
            viewController.view.backgroundColor = .greenColor()
        }
        
        return viewController
    }
    
    // MARK: - Private Methods
    
    private func configureView() {
        view.backgroundColor = .redColor()
    }
}