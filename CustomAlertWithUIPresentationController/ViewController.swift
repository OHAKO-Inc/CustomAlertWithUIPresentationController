//
//  ViewController.swift
//  CustomAlertWithUIPresentationController
//
//  Created by Yoshikuni Kato on 2016/03/29.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBAction func defaultAlertButtonTapped(sender: AnyObject) {
        let alertController = UIAlertController(title: "デフォルトアラート", message: "UIAlertController使用", preferredStyle: .Alert)
        alertController.addAction(
            UIAlertAction(title: "閉じる", style: .Default, handler: { (action) in
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
        )
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func showButtonTapped(sender: UIButton) {
        showCustomAlertVC("カスタムアラート", message: "自作クラス使用")
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

