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
        
        let screenBounds = UIScreen.main.bounds
        let initFrame = transitionContext.initialFrame(for: fromVC!)
        let finalFrame = initFrame.offsetBy(dx: 0, dy: screenBounds.size.height)
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC!.view)
        containerView.sendSubviewToBack(toVC!.view)
        
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            fromVC?.view.frame = finalFrame
        }, completion: transitionContext.completeTransition(!transitionContext.transitionWasCancelled))
    }

}
