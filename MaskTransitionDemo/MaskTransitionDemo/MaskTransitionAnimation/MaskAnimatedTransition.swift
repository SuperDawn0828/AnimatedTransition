//
//  MaskAnimatedTransition.swift
//  MaskTransitionDemo
//
//  Created by 黎明 on 2017/8/14.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

class MaskAnimatedTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum MaskAnimatedTransitionModalType {
        
        case present
        
        case dismiss
    }
    
    var modalType: MaskAnimatedTransitionModalType
    
    init(_ modalType: MaskAnimatedTransitionModalType) {
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
    
    private func presentAnimateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        let width = containerView.bounds.width
        let height = containerView.bounds.height
        
        let toView = toViewController.view
        toView?.backgroundColor = .clear
        toView?.frame = CGRect(x: 0, y: 0, width: width, height: height)
        containerView.addSubview(toView!)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: { 
            toView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }, completion: { (finish) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
    private func dismissAnimateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        let fromView = fromViewController.view
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: { 
            fromView?.backgroundColor = .clear
        }, completion: { (finish) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
}
