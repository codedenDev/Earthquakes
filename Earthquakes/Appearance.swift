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
            guard let _ = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
                return
            }

            self.setupNavigationBar()
    //        self.setupTabBar()
    //        self.setupTableView()
        }
        
        static func setupNavigationBar() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = UIColor.Font.darkBrown
            UINavigationBar.appearance().barTintColor = UIColor.Font.darkGreen
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.Font.darkGreen]
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.Font.darkGreen]
            
    //        appearance.shadowColor = nil
            
            UINavigationBar.appearance().tintColor = UIColor.Font.darkGreen
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
}

