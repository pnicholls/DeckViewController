//
//  CardPresentationController.swift
//  DeckViewController
//
//  Created by Peter Nicholls on 9/10/2015.
//  Copyright © 2015 Peter Nicholls. All rights reserved.
//

import Foundation
import UIKit

class CardPresentationController: UIPresentationController {
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    override func presentationTransitionWillBegin() {
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ (coordinatorContext) -> Void in
            // Nothing to do
        }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ (coordinatorContext) -> Void in
            // Nothing to do
        }, completion: nil)
    }
    
    override func containerViewWillLayoutSubviews() {
        guard let presentedView = presentedView() else {
            return
        }
        
        presentedView.frame = frameOfPresentedViewInContainerView()
    }
    
    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return parentSize
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        guard let containerView = containerView else {
            return CGRectZero
        }
        
        return containerView.frame
    }
}