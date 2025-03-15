//
//  AppDelegate.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var listOfMoviesRouter = ListOfMoviesRouter()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        listOfMoviesRouter.showListOfMovies(window: window)
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
