//
//  CustomAlertViewController.swift
//  CustomAlertWithUIPresentationController
//
//  Created by Yoshikuni Kato on 2016/03/29.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

final class CustomAlertViewController: UIViewController {
    
    var initialTitle: String!
    var initialMessage: String!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func closeButtonTapped(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    func setup(title: String, message: String) {
        self.initialTitle = title
        self.initialMessage = message
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = initialTitle
        messageLabel.text = initialMessage
    }
}
