//
//  PresentingViewController.swift
//  InteractiveAnimationTransition
//
//  Created by 黎明 on 2017/8/16.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

class PresentingViewController: UIViewController {
    
    let transitionDelegate = TransitionDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        let tapGR = UITapGestureRecognizer.init(target: self, action: #selector(tapGestureTecognizer(gr:)))
        view.addGestureRecognizer(tapGR)
    }
    
    @objc private func tapGestureTecognizer(gr: UITapGestureRecognizer) {
        let presentedVC = PresentedViewController()
        presentedVC.transitioningDelegate = transitionDelegate
        presentedVC.modalPresentationStyle = .custom
        present(presentedVC, animated: true, completion: nil)
    }
}
