//
//  HomeScreenView.swift
//  ShgardiApp
//
//  Created by Raghavendra Dattawad on 18/02/25.
//

import SwiftUI

import SwiftUI

struct HomeScreenView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                // Search Bar with localized placeholder
                TextField(Localization.searchPlaceholder, text: $viewModel.searchQuery)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding()

                List(viewModel.people) { person in
                    NavigationLink(destination: DetailView(person: person)) {
                        HStack {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(person.profile_path ?? "")")) { image in
                                image.resizable().scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())

                            Text(person.name)
                        }
                    }
                    .onAppear {
                        if person.id == viewModel.people.last?.id {
                            viewModel.fetchPopularPeople()
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchPopularPeople()
                }
            }
            .navigationTitle(Localization.navigationTitle)
            .onChange(of: viewModel.searchQuery) { _ in
                // Fetch people when search query changes
                viewModel.searchPeople()
            }
            // Show an alert if no results are found
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text(Localization.noResultsAlertTitle),
                    message: Text(Localization.noResultsAlertMessage),
                    dismissButton: .default(Text(Localization.alertOkButton)) 
                )
            }
        }
    }
}
