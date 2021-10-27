//
//  MovieListDataSource.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 27/10/2021.
//

import UIKit

class MovieListDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    var items: [Movie] = []
    
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

