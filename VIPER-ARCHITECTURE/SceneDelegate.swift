//
//  SceneDelegate.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//

import UIKit
import Foundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
    }
    
}
