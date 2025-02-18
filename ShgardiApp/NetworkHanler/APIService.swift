//
//  APIService.swift
//  ShgardiApp
//
//  Created by Raghavendra Dattawad on 18/02/25.
//

import Foundation
/// API Calling  with 
class APIService {
    func fetchPopularPeople(page: Int, query: String?, completion: @escaping (Result<[Person], Error>) -> Void) {
        var urlString = "\(APIConstants.popularPeopleEndpoint)&page=\(page)"
        
        if let query = query, !query.isEmpty {
            urlString = "\(APIConstants.baseURL)search/person?api_key=\(APIConstants.apiKey)&query=\(query)&page=\(page)"
        }
        
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }

            do {
                let response = try JSONDecoder().decode(PeopleResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
