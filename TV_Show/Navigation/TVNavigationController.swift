//
//  TVNavigationController.swift
//  TV_Show
//
//  Created by 郑娇鸿 on 17/3/4.
//  Copyright © 2017年 郑娇鸿. All rights reserved.
//

import UIKit

class TVNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.使用运行时, 打印手势中所有属性
        guard let targets = interactivePopGestureRecognizer!.value(forKey:  "_targets") as? [NSObject] else { return }
        let targetObjc = targets[0]
        let target = targetObjc.value(forKey: "target")
        let action = Selector(("handleNavigationTransition:"))
        
        let panGes = UIPanGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(panGes)
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }
}
