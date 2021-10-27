//
//  EndPoints.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 27/10/2021.
//

import Foundation

enum BaseUrls: String {
   case url = "https://api.themoviedb.org/3/"
}

struct APISettings {
   static var serverUrl: String = {
       return BaseUrls.url.rawValue
   }()
}

enum EndPoints: String {
    
   case listMovies
   case detail
    
   var path : String {
       switch self {
       case .listMovies:
           return "discover/movie?api_key=\(Constants.apiKey)"
       case .detail:
           return "/movie"
       }
   }
}

extension EndPoints: CustomStringConvertible {
    var description: String { return APISettings.serverUrl.appending(path)  }
}
