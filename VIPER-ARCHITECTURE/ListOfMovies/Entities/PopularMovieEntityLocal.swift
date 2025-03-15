//
//  PopularMovieEntityLocal.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//


import Foundation


struct PopularMovieEntityLocal {
    
    let id: Int
    let title: String
    let overview: String
    let poster: String?
    let voteAverage: Double
}

extension PopularMovieEntityLocal {
    
    static func convert(_ dto: PopularMovieEntity) -> PopularMovieEntityLocal {
       
        return PopularMovieEntityLocal(id: dto.id,
                                       title: dto.title,
                                       overview: dto.overview,
                                       poster: dto.poster,
                                       voteAverage: dto.voteAverage)
    }
    
}
