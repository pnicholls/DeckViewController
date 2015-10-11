//
//  CardTransitioningDelegate.swift
//  DeckViewController
//
//  Created by Peter Nicholls on 9/10/2015.
//  Copyright © 2015 Peter Nicholls. All rights reserved.
//

import Foundation
import UIKit

class CardTransitioningDelegate : NSObject, UIViewControllerTransitioningDelegate {
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return CardPresentationController(presentedViewController: presented, presentingViewController: source)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CardTransitionAnimator(interactive: false, presenting: true)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CardTransitionAnimator(interactive: false, presenting: false)
    }
    
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        // We return nil here as we don't want to animate the presentation
        return nil
    }
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return CardTransitionAnimator(interactive: true, presenting: false)
    }
}