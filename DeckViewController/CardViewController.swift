//
//  CardViewController.swift
//  DeckViewController
//
//  Created by Peter Nicholls on 9/10/2015.
//  Copyright © 2015 Peter Nicholls. All rights reserved.
//

import Foundation
import UIKit

class CardViewController: UIViewController {
    
    // MARK: - Internal Properties
    
    // MARK: - Private Properties

    var animationController: CardTransitionAnimator?
    
    var interactionController: CardTransitionAnimator?
    
    // MARK: - Initalizers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        configureInteractiveInteraction()
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods
    
    private func configureInteractiveInteraction() {
        guard
            let transitioningDelegate = self.transitioningDelegate,
            let animationController = transitioningDelegate.animationControllerForDismissedController?(self) as? CardTransitionAnimator,
            let interactionController = transitioningDelegate.interactionControllerForDismissal?(animationController) as? CardTransitionAnimator
        else {
            return
        }
        
        self.animationController = animationController
        self.interactionController = interactionController
        
        self.interactionController!.attachToViewController(self)
    }
    
    private func configureView() {
        view.userInteractionEnabled = true
    }
}