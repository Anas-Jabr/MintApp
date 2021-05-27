//
//  MiddleViewController.swift
//  Mint Task
//
//  Created by Anas J on 5/27/21.
//

import UIKit

class MiddleViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
        setNeedsStatusBarAppearanceUpdate()
    }
}
