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

    var presenter: MovieListPresenterProtocol?
    private var cancellableSet = Set<AnyCancellable>()

    func fetchMoviesList() {
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
                self?.presenter?.presentMoviesList(movies: movies)
            })
            .store(in: &self.cancellableSet)
    }
}
