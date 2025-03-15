//
//  ListOfMoviesInteractor.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//

import Foundation

/* La Url seguido ? + api_key= + numeroApiKey    */
class ListOfMoviesInteractor: ListOfMoviesInteractorProtocol {
    
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let apiKey = "214e1e94e242dbaa1c5271729d90b73c"
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)")
        let (data, _) = try! await URLSession.shared.data(from: url!)
        
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
    
}
