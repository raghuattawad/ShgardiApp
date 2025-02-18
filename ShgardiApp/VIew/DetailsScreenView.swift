//
//  DetailsScreenView.swift
//  ShgardiApp
//
//  Created by Raghavendra Dattawad on 18/02/25.
//


import SwiftUI

struct DetailView: View {
    var person: Person

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(person.profile_path ?? "")")) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            .clipShape(Circle())

            Text(person.name)
                .font(.title)
                .bold()
                .padding()

            if let biography = person.biography {
                Text(biography)
                    .padding()
                    .font(.body)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .navigationTitle(person.name)
        .padding()
    }
}

