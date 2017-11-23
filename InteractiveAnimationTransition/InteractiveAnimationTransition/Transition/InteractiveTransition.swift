//
//  InteractiveTransition.swift
//  InteractiveAnimationTransition
//
//  Created by 黎明 on 2017/8/17.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

class InteractiveTransition: NSObject, UIViewControllerInteractiveTransitioning {

    enum InteractiveTransitionModalType {
        
        case present
        
        case dismiss
    }
    
    var presentedViewController: UIViewController? = nil {
        didSet {
            let panGR = UIPanGestureRecognizer(target: self, action: #selector(panGestureReconizerAction(_:)))
            self.presentedViewController?.view.addGestureRecognizer(panGR)
        }
    }
    
    var transitionContext: UIViewControllerContextTransitioning? = nil
    
    var animator: UIViewControllerAnimatedTransitioning? = nil
    
    var modalType: InteractiveTransitionModalType = .present
    
    var isInteraction: Bool = false
    
    func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        if modalType == .present {
            presentStartInteractiveTransition(transitionContext)
        } else {
            dismissStartInteractiveTransition(transitionContext)
        }
    }
    
    func presentStartInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
    }
    
    func dismissStartInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
    }
    
    @objc private func panGestureReconizerAction(_ panGR: UIPanGestureRecognizer) {
        
        var center = CGPoint(x: 0, y: 0)
        let containerView = transitionContext?.containerView
        var fromView: UIView? = nil
        var width: CGFloat = 0.0
        var height: CGFloat = 0.0
        
        if containerView != nil {
            let fromViewController = transitionContext?.viewController(forKey: .from)
            fromView = fromViewController!.view
            
            width = containerView!.bounds.width
            height = containerView!.bounds.height
            let point = panGR.translation(in: containerView)
            var scaleY = 1 - point.y / height
            let containerCenter = containerView!.center
            center = CGPoint(x: point.x + containerCenter.x, y: point.y + containerCenter.y)
            
            if scaleY >= 1 {
                scaleY = 1.0
            }
            
            transitionContext?.updateInteractiveTransition(scaleY)
            
            fromView?.alpha = scaleY
            fromView?.bounds = CGRect(x: 0, y: 0, width: width * scaleY, height: height * scaleY)
            fromView?.center = center
        }
        
        print(center)
        
        let state = panGR.state
        switch state {
        case .began:
            isInteraction = true
            presentedViewController?.dismiss(animated: true, completion: nil)
        case .changed:
            break
        case .ended:
            
            if center.y > 600 {
                UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
                    fromView?.alpha = 0
                    var frame = fromView!.frame
                    frame.origin.y = height
                    fromView?.frame = frame
                }, completion: { [unowned self] (finish) in
                    self.isInteraction = false
                    self.transitionContext?.completeTransition(true)
                })
            } else {
                UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
                    fromView?.alpha = 1.0
                    fromView?.center = containerView!.center
                    fromView?.bounds = containerView!.bounds
                }, completion: { [unowned self] (finish) in
                    self.isInteraction = false
                    self.transitionContext?.cancelInteractiveTransition()
                    self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled)
                })
            }
        case .failed:
            break
        case .possible:
            break
        case .cancelled:
            break
        }
    }
}
