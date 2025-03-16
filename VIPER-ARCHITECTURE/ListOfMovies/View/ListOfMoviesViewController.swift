//
//  ListOfMoviesViewController.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//

import UIKit

class ListOfMoviesViewController: UIViewController {
    
    private var presenter: ListOfMoviesPresenterProtocol?
    
    init(presenter: ListOfMoviesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        self.presenter?.onViewApper()
    }
}

extension ListOfMoviesViewController: LisOfMoviesUIProtocol {
    
    
    func reloadData(movies: [PopularMovieEntityLocal]) {
        print("📱 ViewController received \(movies.count) movies")
        if movies.isEmpty {
            print("⚠️ Movies array is empty")
        } else {
            movies.forEach { movie in
                print("🎬 The Movie is: \(movie)")
            }
        }
    }
    
    func showERROR(message: String) {
        print("The eror is: \(message)")
    }
    
    
}

