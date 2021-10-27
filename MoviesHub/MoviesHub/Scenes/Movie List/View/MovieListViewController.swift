//
//  MovieListViewController.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 25/10/2021.
//

import UIKit

protocol MovieListViewControllerProtocol//: UIViewControllerRoutingProtocol
{
    func display(movies: Movies)
}

class MovieListViewController: UIViewController, MovieListViewControllerProtocol {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties

    //    var interactor: MovieListInteractorProtocol? = MovieListInteractor()
    var interactor: MovieListInteractor? = MovieListInteractor()
    var dataSource = MovieListDataSource()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        interactor?.viewController = self
        interactor?.fetchMoviesList()
    }

    // MARK: UI
    
    private func setUpUI() {
        title = "MoviesHub"
        setUpTableView()
    }

    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.register(MovieTableViewCell.nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    // MARK: Actions

    func display(movies: Movies) {
        DispatchQueue.main.async { [weak self] in
            self?.dataSource.items = movies.results
            self?.tableView.reloadData()
        }
    }
}

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
