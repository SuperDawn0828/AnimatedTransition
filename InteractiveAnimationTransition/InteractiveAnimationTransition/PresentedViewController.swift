//
//  PresentedViewController.swift
//  InteractiveAnimationTransition
//
//  Created by 黎明 on 2017/8/16.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {
    
    var transitionDelegate: TransitionDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        transitionDelegate = transitioningDelegate as? TransitionDelegate
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapGestureTecognizer(gr:)))
        view.addGestureRecognizer(tapGR)
    }
    
    @objc private func tapGestureTecognizer(gr: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}





