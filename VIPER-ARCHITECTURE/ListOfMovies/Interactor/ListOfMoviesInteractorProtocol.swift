//
//  ListOfMoviesInteractorProtocol.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//

protocol ListOfMoviesInteractorProtocol: AnyObject {
    
    func getListOfMovies() async -> PopularMovieResponseEntity?
    
}
