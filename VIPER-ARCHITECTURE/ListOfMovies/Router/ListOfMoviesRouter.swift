//
//  ListOfMoviesRouter.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//

import UIKit
class ListOfMoviesRouter: ListOfMoviesRouterProtocol {
    
    func showListOfMovies(window: UIWindow?) {
        let viewController = ListOfMoviesViewController()
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(interactor: interactor)
        presenter.view = viewController as? any LisOfMoviesUIProtocol 
    
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
    }
    
    
}
