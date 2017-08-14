//
//  ViewController.swift
//  SheetTransitionDemo
//
//  Created by 黎明 on 2017/8/14.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let transitionDelegate = TransitionDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        let presentVC = PresentViewController()
        presentVC.transitioningDelegate = transitionDelegate
        presentVC.presentation(presentedViewController: self, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

