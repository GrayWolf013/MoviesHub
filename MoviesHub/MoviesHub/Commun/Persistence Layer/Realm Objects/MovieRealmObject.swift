//
//  MovieRealmObject.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 4/11/2021.
//

import Foundation
import RealmSwift

final class MovieRealmObject: Object {
    @objc dynamic var id = 0
    @objc dynamic var originalTitle: String? = ""
    @objc dynamic var overview: String? = ""
    @objc dynamic var posterPath: String? = ""
    @objc dynamic var releaseDate: String? = ""
    @objc dynamic var title: String? = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}
