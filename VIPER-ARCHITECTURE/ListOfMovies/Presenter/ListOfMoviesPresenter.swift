//
//  ListOfMoviesPresenter.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//


import Foundation

protocol LisOfMoviesUIProtocol: AnyObject {
    func reloadData(movies: [PopularMovieEntityLocal])
    func showERROR(message: String)
}

final class ListOfMoviesPresenter: ListOfMoviesPresenterProtocol {
    
    private let interactor: ListOfMoviesInteractorProtocol
    weak var view: LisOfMoviesUIProtocol?
    
    init(interactor: ListOfMoviesInteractorProtocol) {
        self.interactor = interactor
    }
    
    func onViewApper() {
        print("onViewApper called")
        Task {
            do {
                // Add explicit type annotation here
                let movies: PopularMovieResponseEntityLocal = try await interactor.getListOfMovies()!
                
                await MainActor.run {
                    // Use non-optional movies since getListOfMovies now returns non-optional
                    view?.reloadData(movies: movies.results)
                }
            } catch {
                await MainActor.run {
                    print("The Error is")
                    view?.showERROR(message: error.localizedDescription)
                }
            }
        }
    }
}
