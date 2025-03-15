//
//  ListOfMoviesPresenter.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//


import Foundation

protocol LisOfMoviesUIProtocol: AnyObject {
    func reloadData(movies: [PopularMovieEntity])
}

class ListOfMoviesPresenter: ListOfMoviesPresenterProtocol {
    
    // MARK: - PROPERTIES
    weak var view: LisOfMoviesUIProtocol?
    private let interactor: ListOfMoviesInteractorProtocol?
    
    
    // MARK: - DESIGNATER INITIALIZER
    init(interactor: ListOfMoviesInteractorProtocol?) {
        self.interactor = interactor
    }
    
    func onViewApper() {
        print("onViewApper called")
        Task {
            let modelRepository = await interactor?.getListOfMovies()
            print("Data received from API")
            view?.reloadData(movies: modelRepository?.results ?? [])
        }
    }
    
    
}
