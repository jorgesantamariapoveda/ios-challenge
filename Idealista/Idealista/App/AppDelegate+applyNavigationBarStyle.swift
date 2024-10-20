//
//  AppDelegate+applyNavigationBarStyle.swift
//  Idealista
//
//  Created by Jorge on 19/10/24.
//

import UIKit

extension AppDelegate {
    
    func applyNavigationBarStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.idealistaGreen
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.idealistaGrayBlack
        ]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UINavigationBar.appearance().tintColor = UIColor.idealistaPurple
    }
}
