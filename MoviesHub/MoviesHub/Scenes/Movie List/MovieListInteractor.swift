//
//  MovieListInteractor.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 27/10/2021.
//

import Foundation
import Combine

protocol MovieListInteractorProtocol
{
    func fetchMoviesList()
}


class MovieListInteractor: MovieListInteractorProtocol {
    
    //TODO: remove after test
    var viewController: MovieListViewControllerProtocol?
    
    var presenter: MovieListPresenter? = MovieListPresenter()
//    var presenter: MovieListPresenterProtocol? = MovieListPresenter()
    private var subscriber = Set<AnyCancellable>()

    func fetchMoviesList() {
        MoviesService.shared.fetchMovies()
            .receive(on: DispatchQueue.main)
            .sink { response in
                switch response {
                case .failure(let error):
                    debugPrint(error)
//                    self.presenter?.onErrorSearch(error: error)
                case .finished:
                    debugPrint("process Finished")
                }
            } receiveValue: { [weak self] movies in
                self?.presenter?.viewController = self?.viewController
                self?.presenter?.presentMoviesList(movies: movies)
//                self.presenter?.onSuccessSearch(res: entities)
            }
            .store(in: &self.subscriber)
    }
}
