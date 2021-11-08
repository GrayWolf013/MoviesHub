//
//  Movies.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 27/10/2021.
//

import Foundation

// MARK: - Movie
struct Movies: Codable {

    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct Movie: Codable, Persistable {
    let id: Int?
    let originalTitle, overview: String?
    let posterPath, releaseDate, title: String?

    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }

    public init(managedObject: MovieRealmObject) {
        id = managedObject.id
        originalTitle = managedObject.originalTitle
        overview = managedObject.overview
        posterPath = managedObject.posterPath
        releaseDate = managedObject.releaseDate
        title = managedObject.title
    }
    public func managedObject() -> MovieRealmObject {
        let movie = MovieRealmObject()
        movie.id = id ?? 0
        movie.originalTitle = originalTitle
        movie.overview = overview
        movie.posterPath = posterPath
        movie.releaseDate = releaseDate
        movie.title = title
        return movie
    }
}
