//
//  MainTabBarViewController.swift
//  Mint Task
//
//  Created by Anas J on 5/27/21.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    // Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupMiddleButton()
        if let tabItems = self.tabBar.items {
            tabItems[2].isEnabled = false
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureUITabBarColors()
    }
    
    private func configureUITabBarColors(){
        tabBar.unselectedItemTintColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
        UITabBar.appearance().tintColor = UIColor(red: 244/255, green: 0/255, blue: 9/255, alpha: 1)
        tabBar.selectionIndicatorImage = UIImage.createSelectionIndicator(color: UIColor(red: 244/255, green: 0/255, blue: 9/255, alpha: 1), size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height:  tabBar.frame.height), lineWidth: 3.0)
    }

    // Setup Middle Button
    private func setupMiddleButton(){
        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-35, y: -40, width: 70, height: 70))
        middleBtn.setImage(UIImage(named: "bottom_bar_fab"), for: .normal)
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }
    
    // Selector Methods
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2
        tabBar.selectionIndicatorImage = nil
    }
    
}

// MARK:- UITabBarControllerDelegate
extension MainTabBarViewController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController != self.viewControllers?[2]{
            tabBar.selectionIndicatorImage = UIImage.createSelectionIndicator(color: UIColor(red: 244/255, green: 0/255, blue: 9/255, alpha: 1), size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height:  tabBar.frame.height), lineWidth: 3.0)
        }
    }
}
