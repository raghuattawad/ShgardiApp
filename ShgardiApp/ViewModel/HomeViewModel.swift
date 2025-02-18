//
//  HomeViewModel.swift
//  ShgardiApp
//
//  Created by Raghavendra Dattawad on 18/02/25.
//

import Foundation
// View Model Class ///
class HomeViewModel: ObservableObject {
    @Published var people: [Person] = []
    @Published var isLoading = false
    @Published var searchQuery: String = "" // Search query state
    @Published var showAlert = false // To control showing the alert
    private let apiService = APIService()
    private var currentPage = 1
    
    func fetchPopularPeople() {
        guard !isLoading else { return }
        isLoading = true
        
        apiService.fetchPopularPeople(page: currentPage, query: searchQuery) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let newPeople):
                    self?.people.append(contentsOf: newPeople)
                    self?.currentPage += 1
                case .failure(let error):
                    print("Error fetching data: \(error.localizedDescription)")
                }
                
                if self?.people.isEmpty ?? true {
                    self?.showAlert = true // Trigger the alert if no results are found
                }
            }
        }
    }
    
    // Function to update the search query
    func searchPeople() {
        people = [] // Reset the people list for a new search
        currentPage = 1
        fetchPopularPeople() // Fetch with the new search query
    }
}
