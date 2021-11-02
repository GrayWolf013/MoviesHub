//
//  MoviesService.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 27/10/2021.
//

import Alamofire
import Combine

protocol MoviesServiceProtocol: AnyObject {
    func fetchMovies() -> Future<Movies, Error>
}

class MoviesService: MoviesServiceProtocol {
    
    static let shared = MoviesService()
    
    func fetchMovies() -> Future<Movies, Error> {
         return CoreService.request(url: EndPoints.listMovies.description, method: .get, parameters: nil)
    }
}
