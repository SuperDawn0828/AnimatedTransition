//
//  MaskViewController.swift
//  MaskTransitionDemo
//
//  Created by 黎明 on 2017/8/14.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

class MaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    public func presentation(presentedViewController: UIViewController, animated: Bool, completion: (() -> ())?) {
        modalPresentationStyle = .custom
        presentedViewController.present(self, animated: animated, completion: completion)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
