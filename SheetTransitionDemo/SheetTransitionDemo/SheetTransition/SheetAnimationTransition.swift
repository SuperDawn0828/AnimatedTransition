//
//  SheetAnimationTransition.swift
//  SheetTransitionDemo
//
//  Created by 黎明 on 2017/8/14.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

class SheetAnimationTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum SheetAnimationTransitionModalType {
        
        case present
        
        case dismiss
    }
    
    var modalType: SheetAnimationTransitionModalType
    
    init(_ modalType: SheetAnimationTransitionModalType) {
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
        toView?.frame = CGRect(x: 0, y: height, width: width, height: 215)
        containerView.addSubview(toView!)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: { 
            toView?.frame = CGRect(x: 0, y: height - 215, width: width, height: 215)
        }, completion: { (finish) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
    func dismissAnimateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        let fromView = fromViewController.view
        
        let width = containerView.bounds.width
        let height = containerView.bounds.height
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: { 
            fromView?.frame = CGRect(x: 0, y: height, width: width, height: 215)
        }, completion: { (finish) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
