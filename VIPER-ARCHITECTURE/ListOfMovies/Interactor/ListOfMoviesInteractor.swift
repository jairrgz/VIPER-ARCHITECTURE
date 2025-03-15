//
//  ListOfMoviesInteractor.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//

import Foundation

/* La Url seguido ? + api_key= + numeroApiKey    */
class ListOfMoviesInteractor: ListOfMoviesInteractorProtocol {
    
    func getListOfMovies() async -> PopularMovieResponseEntity? {
        do {
            let apiKey = "214e1e94e242dbaa1c5271729d90b73c"
            guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)") else {
                print("Error: Invalid URL")
                return nil
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error: Invalid server response")
                return nil
            }
            
            let decoder = JSONDecoder()
            let movieResponse = try decoder.decode(PopularMovieResponseEntity.self, from: data)
            return movieResponse
            
        } catch {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
}
