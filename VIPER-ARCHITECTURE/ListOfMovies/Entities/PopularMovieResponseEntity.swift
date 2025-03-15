//
//  Untitled.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//



struct PopularMovieResponseEntity: Decodable {
    
    // MARK: - PROPERTIE
    let results: [PopularMovieEntity]
    
    var ListOfMoviesRouterProtocol = ListOfMoviesRouter()
    // MARK: - ENUM
    enum CodingKeys: CodingKey {
        case results
    }
    
    // MARK: - DESIGNATED INITIALIZER
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([PopularMovieEntity].self, forKey: .results)
    }
    
}
