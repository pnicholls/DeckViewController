//
//  CardTransitionAnimator.swift
//  DeckViewController
//
//  Created by Peter Nicholls on 9/10/2015.
//  Copyright © 2015 Peter Nicholls. All rights reserved.
//

import Foundation
import UIKit

class CardTransitionAnimator: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    // MARK: - Internal Properties
    
    // MARK: - Private Propertes
    
    private let interactive: Bool
    
    private let presenting: Bool
    
    private lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "userDidPan:")
        return panGestureRecognizer
    }()
    
    private var viewController: UIViewController?
    
    // MARK: - Initalizers
    
    deinit {
        print("deinit")
    }
    
    init(interactive: Bool, presenting: Bool) {
        self.interactive = interactive
        self.presenting = presenting
        
        super.init()
    }
    
    // MARK: - Internal Methods
    
    func attachToViewController(viewController: UIViewController) {
        self.viewController = viewController
        viewController.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    func userDidPan(panGestureRecognizer: UIPanGestureRecognizer) {
        guard let viewController = viewController else {
            return
        }
        
        let location = panGestureRecognizer.locationInView(viewController.view)
        let velocity = panGestureRecognizer.velocityInView(viewController.view)
        let translation = panGestureRecognizer.translationInView(viewController.view)
        let percentComplete = ((translation.x / CGRectGetWidth(viewController.view.bounds) * 0.5) * 100) * 2
        
        switch panGestureRecognizer.state {
        case .Possible:
            break
        case .Began:
            if interactive && !presenting {
                viewController.dismissViewControllerAnimated(true, completion: nil)
            }
        case .Changed:
            updateInteractiveTransition(percentComplete)
        case .Ended:
            if interactive && !presenting {
                if velocity.x < 0 {
                    finishInteractiveTransition()
                } else {
                    cancelInteractiveTransition()
                }
            }
        case .Cancelled:
            cancelInteractiveTransition()
        case .Failed:
            cancelInteractiveTransition()
        }
    }
    
    // MARK: - Private Methods
    
    private func animatePresentationWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        guard let containerView = transitionContext.containerView(), presentedControllerView = transitionContext.viewForKey(UITransitionContextToViewKey) else {
            return
        }

        // We don't animate the presentation, only the dismissal
        containerView.addSubview(presentedControllerView)
        transitionContext.completeTransition(true)
    }
    
    private func animateDismissalWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey),
            let containerView = transitionContext.containerView()
        else {
            return
        }
        
        let endFrame = CGRectOffset(containerView.bounds, -CGRectGetWidth(containerView.bounds), 0)
        
        // Animate the presented view off the bottom of the view
        UIView.animateWithDuration(Double(duration), delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .AllowUserInteraction, animations: {
            fromViewController.view.frame = endFrame
        }, completion: {(completed: Bool) -> Void in
            transitionContext.completeTransition(completed)
        })
    }
}

extension CardTransitionAnimator {
    
    // MARK: - UIViewControllerAnimatedTransitioning methods
    
    func animationEnded(transitionCompleted: Bool) {
        print("animation ended")
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return Double(duration)
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)  {
        print("animate transition")
        
        if presenting {
            animatePresentationWithTransitionContext(transitionContext)
        } else {
//            animateDismissalWithTransitionContext(transitionContext)
        }
    }
}

extension CardTransitionAnimator {
    
    // MARK: - UIViewControllerInteractiveTransitioning
    
    override func startInteractiveTransition(transitionContext: UIViewControllerContextTransitioning) {
        super.startInteractiveTransition(transitionContext)
        
        print("start interactive transition")
    }
    
    override func updateInteractiveTransition(percentComplete: CGFloat) {
        super.updateInteractiveTransition(percentComplete)
        
        if interactive && !presenting {
            let endFrame = CGRectOffset(viewController!.view.bounds, 1.0 - percentComplete, 0)
            viewController?.view.frame = endFrame
        }
    }
    
    override func finishInteractiveTransition() {
        super.finishInteractiveTransition()
        
        print("finish interactive transition")
    }
    
    override func cancelInteractiveTransition() {
        super.cancelInteractiveTransition()
        
        print("cancel interactive transition")
    }
}