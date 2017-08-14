//
//  PresentViewController.swift
//  SheetTransitionDemo
//
//  Created by 黎明 on 2017/8/14.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }
    
    public func presentation(presentedViewController: UIViewController, animated: Bool, completion: (() -> ())?) {
        modalPresentationStyle = .custom
        presentedViewController.present(self, animated: animated, completion: completion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
