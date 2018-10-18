//
//  LJSwipeUpInteractiveTransition.swift
//  VCTransitionDemo
//
//  Created by Jater on 2018/10/18.
//  Copyright © 2018年 Jater. All rights reserved.
//

import UIKit

class LJSwipeUpInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    var shouldComplete: Bool! = false
    var presentingVC: UIViewController!
    open var interacting: Bool! = false
    
    public func wireToViewController(viewController: UIViewController) ->Void {
        self.presentingVC = viewController
        self.prepareGestureRecognizer(inView: viewController.view)
    }
    
    private func prepareGestureRecognizer(inView view:UIView) -> Void {
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(handleGesture(gesture:)))
        view.addGestureRecognizer(gesture)
    }
    
    func completionSpeed() -> CGFloat {
        return 1 - self.percentComplete;
    }
    
    @objc func handleGesture(gesture:UIPanGestureRecognizer) -> Void {
        let translation = gesture.translation(in: gesture.view?.superview)
        switch gesture.state {
        case .began:
            self.interacting = true
            self.presentingVC.dismiss(animated: true, completion: nil)
            break
        case .changed:
            var fraction: CGFloat = translation.y / 400.0
            fraction = CGFloat(fminf(fmaxf(Float(fraction), 0.0), 1.0))
            self.shouldComplete = (fraction > 0.5)
            self.update(fraction)
            break
        case .cancelled, .ended:
            self.interacting = false
            if (!self.shouldComplete || gesture.state == .cancelled) {
                self.cancel()
            } else {
                self.finish()
            }
            break
        default:
            break
        }
    }
}
