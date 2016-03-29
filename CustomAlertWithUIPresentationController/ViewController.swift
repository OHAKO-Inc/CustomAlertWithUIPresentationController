//
//  ViewController.swift
//  CustomAlertWithUIPresentationController
//
//  Created by Yoshikuni Kato on 2016/03/29.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBAction func showButtonTapped(sender: UIButton) {
        showCustomAlertVC("確認", message: "アラートテストです。")
    }
    
    func showCustomAlertVC(title: String, message: String) {
        let customAlertVC = UIStoryboard(name: "CustomAlertViewController", bundle: nil).instantiateInitialViewController() as! CustomAlertViewController
        customAlertVC.setup(title: title, message: message)
        
        customAlertVC.modalPresentationStyle = .Custom
        customAlertVC.transitioningDelegate = self
        presentViewController(customAlertVC, animated: true, completion: nil)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}

