//
//  LJBouncePresentAnimation.swift
//  VCTransitionDemo
//
//  Created by Jater on 2018/10/17.
//  Copyright © 2018年 Jater. All rights reserved.
//

import UIKit

class LJBouncePresentAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    // This is used for percent driven interactive transitions, as well as for
    // container controllers that have companion animations that might need to
    // synchronize with the main animation.
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    //如果转换是交互式的而不是percentDriven交互式转换，则此方法只能是nop。
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let screenBounds = UIScreen.main.bounds
        let finalFrame = transitionContext.finalFrame(for: toVC!)
        toVC?.view.frame = finalFrame.offsetBy(dx: 0, dy: screenBounds.size.height)
        
        let containerView = transitionContext.containerView;
        containerView.addSubview((toVC?.view)!)
        
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            toVC?.view.frame = finalFrame
        }) { (Bool) in
            transitionContext.completeTransition(true)
        }
        
    }
    
    
    /// A conforming object implements this method if the transition it creates can
    /// be interrupted. For example, it could return an instance of a
    /// UIViewPropertyAnimator. It is expected that this method will return the same
    /// instance for the life of a transition.
    ///符合对象如果它创建的转换可以实现此方法
    ///被打断例如，它可以返回a的实例
    /// UIViewPropertyAnimator。预计此方法将返回相同的内容
    ///过渡生活的实例
//    public func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
//
//    }
    
    
    // This is a convenience and if implemented will be invoked by the system when the transition context's completeTransition: method is invoked.
    //这是一种方便，如果在调用转换上下文的completeTransition：方法时系统将调用它。
    public func animationEnded(_ transitionCompleted: Bool) {
        print("animationEnded")
    }

}
