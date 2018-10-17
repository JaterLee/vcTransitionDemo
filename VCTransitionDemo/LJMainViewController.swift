//
//  LJMainViewController.swift
//  VCTransitionDemo
//
//  Created by Jater on 2018/10/17.
//  Copyright © 2018年 Jater. All rights reserved.
//

import UIKit

class LJMainViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var presentAnimation: LJBouncePresentAnimation = LJBouncePresentAnimation.init()
    
    var dismissAnimation: 
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton.init(type: .roundedRect) as UIButton;
        button.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = self.view.center;
        button.setTitle("Click me", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        
    }
    
    @objc func buttonAction() {
        print(#function);
        let nextViewController = LJNextViewController.init()
        nextViewController.transitioningDelegate = self as? UIViewControllerTransitioningDelegate
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    /*
     UIKit向transitioningDelegate发送消息animationControllerForPresentedController: presentingController:sourceController: 询问animation controller(即实现id<UIViewControllerAnimatedTransitioning>协议的实例对象)。若返回nil，使用内置过渡
     若有返回animation controller，UIKit准备过渡并构建一个transitioning context(id<UIViewControllerContextTransitioning>)
     UIKit通过消息transitionDuration:向animation controller询问过渡时间
     UIKit向animation controller发送消息animateTransition: 传入transitioning context参数，告诉他开始执行动画
     当动画完成，animation controller向transitioning context发送completeTransition:消息
     当过渡完成后，UIKit保证VC和视图层次的一致性。
     */
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.presentAnimation
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
    }
    
    
    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
    }
    
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
    }
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
    }


}



