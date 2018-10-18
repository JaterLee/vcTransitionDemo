//
//  NormalDismissAnimation.swift
//  VCTransitionDemo
//
//  Created by Jater on 2018/10/17.
//  Copyright © 2018年 Jater. All rights reserved.
//

import UIKit

class LJNormalDismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        let initFrame = transitionContext.initialFrame(for: fromVC!)
        let finalFrame = CGRect(x: initFrame.size.width/2, y: initFrame.size.height/2, width: 0, height: 0)
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC!.view)
        containerView.sendSubviewToBack(toVC!.view)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: {
            fromVC?.view.frame = finalFrame
        }, completion: { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
