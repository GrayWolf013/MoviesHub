//
//  MovieListDataSource.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 27/10/2021.
//

import UIKit

class MovieListDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    private var items: [Movie] = []
    
    // MARK: - DI

    func set(items: [Movie]) {
        self.items = items
    }
    
    // uncoment if needed
//    func item(at index: Int) -> Movie {
//        return items[index]
//    }
    
    // MARK: - TableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieTableViewCell.identifier,
            for: indexPath
        ) as? MovieTableViewCell else {
            return .init()
        }
         
        let item = items[indexPath.row]
        cell.configure(movie: item)
        return cell
    }
}

