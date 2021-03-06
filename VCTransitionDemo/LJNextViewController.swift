//
//  LJNextViewController.swift
//  VCTransitionDemo
//
//  Created by Jater on 2018/10/17.
//  Copyright © 2018年 Jater. All rights reserved.
//

import UIKit

protocol LJNextViewControllerDelegate: NSObjectProtocol {
    func nextViewControllerDiDSelectDismiss(currentViewController: LJNextViewController) -> Void
}

class LJNextViewController: UIViewController {
    
    weak open var delegate: LJNextViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        let button = UIButton.init(type: .roundedRect) as UIButton;
        button.clipsToBounds = true
        let screenBounds = UIScreen.main.bounds
        button.frame = CGRect(x: screenBounds.size.width/2-50, y: screenBounds.size.height/2-25, width: 100, height: 50)
        button.setTitle("Dimiss", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(sender: Any) -> Void {
//        if self.delegate?.responds(to: Selector(("nextViewControllerDiDSelectDismiss:")))  == true {
            self.delegate?.nextViewControllerDiDSelectDismiss(currentViewController: self)
//        }
    }

}
