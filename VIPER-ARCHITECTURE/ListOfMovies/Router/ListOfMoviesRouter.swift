//
//  ListOfMoviesRouter.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//

import UIKit

final class ListOfMoviesRouter: ListOfMoviesRouterProtocol {
    
    //MARK: - DESIGNATED INITIALIZER
    init() { }
    
    // MARK: - METHOD
     func showListOfMovies(window: UIWindow?) {
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(interactor: interactor)
        let viewController = ListOfMoviesViewController(presenter: presenter)
        presenter.view = viewController
    
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
    
}
