//
//  CustomPresentationController.swift
//  CustomAlertWithUIPresentationController
//
//  Created by Yoshikuni Kato on 2016/03/29.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

final class CustomPresentationController: UIPresentationController {
    
    private let dimmingView = UIView()
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        dimmingView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6)
        dimmingView.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(dimmingViewTapped(_:)))]
    }
    
    func dimmingViewTapped(sender: UITapGestureRecognizer) {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        guard let containerView = containerView else {
            return
        }
        
        dimmingView.frame = containerView.bounds
        dimmingView.alpha = 0.0
        containerView.insertSubview(dimmingView, atIndex: 0)
        
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ (context) in
            self.dimmingView.alpha = 1.0
            }, completion: nil
        )
    }
    
    override func presentationTransitionDidEnd(completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        guard !completed else {
            return
        }
        dimmingView.removeFromSuperview()
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ (context) in
            self.dimmingView.alpha = 0.0
            }, completion: nil
        )
    }
    
    override func dismissalTransitionDidEnd(completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        guard completed else {
            return
        }
        dimmingView.removeFromSuperview()
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        guard let containerView = containerView else {
            return CGRectZero
        }
        return CGRectMake((containerView.bounds.width - 315.0) / 2.0, (containerView.bounds.height - 200.0) / 2.0, 315.0, 200.0)
    }
    
}