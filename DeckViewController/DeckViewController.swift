//
//  DeckViewController.swift
//  DeckViewController
//
//  Created by Peter Nicholls on 8/10/2015.
//  Copyright © 2015 Peter Nicholls. All rights reserved.
//

import Foundation
import UIKit

class DeckViewController: UIViewController {
    
    // MARK: - Internal Properties

    // MARK: - Private Properties
    
    private var currentIndex = 0
    
    private lazy var cardTransitioningDelegate: CardTransitioningDelegate = {
        let transitioningDelegate = CardTransitioningDelegate()
        return transitioningDelegate
    }()
    
    // MARK: - Initalizers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        presentInitalCardViewControllers()
    }
    
    // MARK: - Internal Methods
    
    func numberOfCardsInDeckViewController(deckViewController: DeckViewController) -> Int {
        return 0
    }
    
    func deckViewController(deckViewController: DeckViewController, viewControllerForCardAtIndex index: Int) -> UIViewController {
        return UIViewController()
    }
    
    // MARK: - Private Methods
    
    private func configureView() {
        view.backgroundColor = .blueColor()
    }
    
    private func presentInitalCardViewControllers() {
        presentBottomCardViewController()
        presentTopCardViewController()
    }
    
    private func presentTopCardViewController() {
        let viewController = deckViewController(self, viewControllerForCardAtIndex: currentIndex) as! CardViewController
        viewController.transitioningDelegate = cardTransitioningDelegate
        viewController.modalPresentationStyle = .Custom
        presentViewController(viewController, animated: true, completion: nil)
    }
    
    private func presentBottomCardViewController() {
        if currentIndex <= numberOfCardsInDeckViewController(self) {
            let index = currentIndex + 1
            let viewController = deckViewController(self, viewControllerForCardAtIndex: index)
            viewController.willMoveToParentViewController(self)
            addChildViewController(viewController)
            view.addSubview(viewController.view)
            viewController.view.frame = self.view.frame
            viewController.didMoveToParentViewController(self)
        }
    }
}