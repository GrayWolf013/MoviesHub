//
//  MovieListPresenter.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 27/10/2021.
//

import UIKit

protocol MovieListPresenterProtocol
{
    func presentMoviesList(movies: Movies)
}

class MovieListPresenter: MovieListPresenterProtocol {
    
    var viewController: MovieListViewControllerProtocol?

    func presentMoviesList(movies: Movies) {
        viewController?.display(movies: movies)
    }
}
