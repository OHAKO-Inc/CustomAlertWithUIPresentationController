//
//  ViewController.swift
//  CustomAlertWithUIPresentationController
//
//  Created by Yoshikuni Kato on 2016/03/29.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBAction func defaultAlertButtonTapped(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "デフォルトアラート", message: "UIAlertController使用", preferredStyle: .alert)
        alertController.addAction(
            UIAlertAction(title: "閉じる", style: .default, handler: { (action) in
                alertController.dismiss(animated: true, completion: nil)
            })
        )
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        showCustomAlertVC("カスタムアラート", message: "自作クラス使用")
    }
    
    func showCustomAlertVC(_ title: String, message: String) {
        let customAlertVC = UIStoryboard(name: "CustomAlertViewController", bundle: nil).instantiateInitialViewController() as! CustomAlertViewController
        customAlertVC.setup(title: title, message: message)
        
        customAlertVC.modalPresentationStyle = .custom
        customAlertVC.transitioningDelegate = self
        present(customAlertVC, animated: true, completion: nil)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

