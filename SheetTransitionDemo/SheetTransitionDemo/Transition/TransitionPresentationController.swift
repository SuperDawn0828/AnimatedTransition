//
//  TransitionPresentationController.swift
//  SheetTransitionDemo
//
//  Created by 黎明 on 2017/8/14.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

class TransitionPresentationController: UIPresentationController {
    
    let maskView = UIView()

    override func presentationTransitionWillBegin() {
        
        let width = containerView?.bounds.width
        let height = containerView?.bounds.height
        
        maskView.backgroundColor = .clear
        maskView.frame = CGRect(x: 0, y: 0, width: width!, height: height!)
        containerView?.addSubview(maskView)
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [unowned self] (_) in
            self.maskView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }, completion: { (_) in
        
        })
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [unowned self] (_) in
            self.maskView.backgroundColor = .clear
        }, completion: { (_) in
        
        })
    }
    
    override func containerViewWillLayoutSubviews() {
        maskView.center = containerView!.center
        maskView.bounds = containerView!.bounds
        
        let width = containerView!.bounds.width
        let height = containerView!.bounds.height
        presentedView?.frame = CGRect(x: 0, y: height - 215, width: width, height: 215)
    }
    
}
