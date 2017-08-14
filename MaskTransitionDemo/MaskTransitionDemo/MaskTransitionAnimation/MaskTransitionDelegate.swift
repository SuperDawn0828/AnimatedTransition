//
//  MaskTransitionDelegate.swift
//  MaskTransitionDemo
//
//  Created by 黎明 on 2017/8/14.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

class MaskTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MaskAnimatedTransition(.present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MaskAnimatedTransition(.dismiss)
    }
    
}
