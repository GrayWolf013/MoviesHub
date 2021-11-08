//
//  MovieListPresenter.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 27/10/2021.
//

import UIKit

protocol MovieListPresenterProtocol {
    func presentMoviesList(movies: [Movie])
}

class MovieListPresenter: MovieListPresenterProtocol {

    // MARK: - Properties

    var viewController: MovieListViewControllerProtocol?

    // MARK: Actions

    func presentMoviesList(movies: [Movie]) {
        viewController?.display(movies: movies)
    }
}
