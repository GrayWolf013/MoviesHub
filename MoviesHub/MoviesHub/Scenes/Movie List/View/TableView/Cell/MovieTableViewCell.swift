//
//  MovieTableViewCell.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 27/10/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: Outlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var coverPictureImageView: UIImageView!

    // MARK: - Properties

    static let identifier = "moviesCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    // MARK: - Actions

    func configure(movie: Movie) {
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        guard let posterPath = movie.posterPath else {return}
        coverPictureImageView.setImageWithUrl(url: BaseUrls.image.rawValue.appending(posterPath),
                                              placeholder: nil,
                                              radius: 0)
    }
}
