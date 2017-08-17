//
//  TransitionDelegate.swift
//  InteractiveAnimationTransition
//
//  Created by 黎明 on 2017/8/16.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

class TransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    let interaction = InteractiveTransition()

    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.interaction.presentedViewController = presented
        return AnimationTransition(.present)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationTransition(.dismiss)
    }
    
    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        interaction.modalType = .dismiss
        return interaction.isInteraction ? interaction : nil
    }
}
