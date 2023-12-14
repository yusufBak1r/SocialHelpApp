//
//  CustomTabbarViewController.swift
//  SocialHelp
//
//  Created by yusuf bakır on 14.12.2023.
//

import UIKit

class CustomTabbarViewController: UITabBarController,UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = delegate
        self.selectedIndex = 0
        // Do any additional setup after loading the view.
        
        
        
        func tabBar (_ tabBar : UITabBar,didSelect item : UITabBarItem) {
            if let tabbar = tabBar as? TabbarView {
                tabbar.updateCurveForTappedIndex()
            }
        }
        
        
    }}
