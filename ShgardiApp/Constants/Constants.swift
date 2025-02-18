//
//  Constants.swift
//  ShgardiApp
//
//  Created by Raghavendra Dattawad on 18/02/25.
//

import Foundation
struct APIConstants {
    static let baseURL = "https://api.themoviedb.org/3/"
    static let apiKey = "09b102b2bc12dd475841e2b16e7df670"
    static let popularPeopleEndpoint = "\(baseURL)person/popular?api_key=\(apiKey)"
}

