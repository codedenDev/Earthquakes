//
//  Appearance.swift
//  Earthquakes
//
//  Created by Richard Kelly on 05/08/2020.
//  Copyright © 2020 Richard Kelly. All rights reserved.
//

import UIKit

class Appearance: NSObject {
    static func setUpApperance() {
        if #available(iOS 13.0, *) {
            guard let _ = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
        } else {
            // Fallback on earlier versions
        }

        self.setupNavigationBar()
       // self.setupTabBar()
      //  self.setupTableView()
    }
    /// This method set the colour scheme of the nav bar
    static func setupNavigationBar() {
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .red
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().barTintColor = .red
            UINavigationBar.appearance().isTranslucent = false
        }
    }
    
    /// This method set the colour scheme of the tab bar
//    static func setupTabBar() {
//        let appearance = UITabBar.appearance()
//        appearance.backgroundColor = UIColor.Font.greendd
//        appearance.tintColor = UIColor.TabBar.selectedTab
//        appearance.unselectedItemTintColor = UIColor.TabBar.unSelectedTab
//        appearance.backgroundImage = UIImage()
//
//        let attributes = [NSAttributedString.Key.font: UIFont.Regular.size0]
//        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
//    }
//
//    static func setupTableView() {
//        let appearance = UITableView.appearance()
//        //appearance.separatorInset = .zero
//        appearance.tableFooterView = UIView()
//    }
}
