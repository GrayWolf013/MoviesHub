//
//  MoviesService.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 27/10/2021.
//

import Foundation
import Combine

enum FetchError: Error {
    case failed
}

protocol MoviesServiceProtocol: AnyObject {
    func fetchMovies() -> AnyPublisher<Movies, Error>
}

class MoviesService: MoviesServiceProtocol {
    
    static let shared = MoviesService()
    
    func fetchMovies() -> AnyPublisher<Movies, Error> {
        guard let url = URL(string: EndPoints.listMovies.description) else {
            return Future<Movies, Error>(){ promise in
                promise(.failure(FetchError.failed))
            }.eraseToAnyPublisher()
        }
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: Movies.self,
                    decoder: JSONDecoder())
            .catch { error in
                Future<Movies, Error>(){ promise in
                    promise(.failure(error))
                }
            }.eraseToAnyPublisher()
        return publisher
    }
}
