//
//  MovieListInteractor.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 27/10/2021.
//

import Foundation
import Combine

protocol MovieListInteractorProtocol {
    func fetchMoviesList()
}

class MovieListInteractor: MovieListInteractorProtocol {

    // MARK: - Properties

    var presenter: MovieListPresenterProtocol?
    private var cancellableSet = Set<AnyCancellable>()
    private let persistenceManager = PersistenceManager()

    // MARK: Actions

    func fetchMoviesList() {
        if let cachedMovies = persistenceManager.fetchObjects(MovieRealmObject.self, resultType: Movie.self) {
            presenter?.presentMoviesList(movies: cachedMovies)
        }
        MoviesService.shared.fetchMovies()
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    debugPrint(error)
                case .finished:
                    debugPrint("movies list fetched from database")
                }
            }, receiveValue: { [weak self] movies in
                self?.presenter?.presentMoviesList(movies: movies.results)
                self?.persistenceManager.saveObjects(movies.results)
            })
            .store(in: &self.cancellableSet)
    }
}
