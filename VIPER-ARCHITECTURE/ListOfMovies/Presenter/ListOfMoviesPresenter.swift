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

final class ListOfMoviesPresenter: ListOfMoviesPresenterProtocol {
    
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
            print("Requesting data from interactor...")
            if let modelRepository = await interactor?.getListOfMovies() {
                print("✅ Interactor returned data: \(modelRepository.results.count) movies")
                await MainActor.run {
                    let result = view?.reloadData(movies: modelRepository.results)
                    
                }
            } else {
                print("❌ Interactor returned nil")
            }
        }
    }
    
    
}
