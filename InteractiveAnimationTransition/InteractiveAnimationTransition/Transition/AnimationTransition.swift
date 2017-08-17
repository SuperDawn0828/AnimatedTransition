//
//  AnimationTransition.swift
//  InteractiveAnimationTransition
//
//  Created by 黎明 on 2017/8/16.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

class AnimationTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum AnimationTransitionModalType {
        
        case present
        
        case dismiss
    }
    
    private var modalType: AnimationTransitionModalType
    
    init(_ modalType: AnimationTransitionModalType) {
        self.modalType = modalType
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if modalType == .present {
            presentAnimateTransition(using: transitionContext)
        } else {
            dismissAnimateTransition(using: transitionContext)
        }
    }
    
    func presentAnimateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        let toView = toViewController.view
        
        let width = containerView.bounds.width
        let height = containerView.bounds.height
        
        toView?.frame = CGRect(x: 0, y: 0, width: width, height: height)
        toView?.alpha = 0
        containerView.addSubview(toView!)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: { 
            toView?.alpha = 1
        }, completion: { (finish) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
    func dismissAnimateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        let fromView = fromViewController.view
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: { 
            fromView?.alpha = 0
        }, completion: { (finish) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }

}
