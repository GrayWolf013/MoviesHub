//
//  MovieListViewController.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 25/10/2021.
//

import UIKit

protocol MovieListViewControllerProtocol//: UIViewControllerRoutingProtocol
{
    func display(movies: [Movie])
}

class MovieListViewController: BaseViewController, MovieListViewControllerProtocol {

    // MARK: Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    var interactor: MovieListInteractorProtocol?
    var dataSource = MovieListDataSource()

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setUpUI()
        interactor?.fetchMoviesList()
    }

    // MARK: Setup

    func setup() {
        let viewController = self
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    // MARK: UI

    private func setUpUI() {
        setUpTableView()
    }

    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.register(MovieTableViewCell.nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    // MARK: Actions

    func display(movies: [Movie]) {
        DispatchQueue.main.async { [weak self] in
            self?.dataSource.set(items: movies)
            self?.tableView.reloadData()
        }
    }
}

extension MovieListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
