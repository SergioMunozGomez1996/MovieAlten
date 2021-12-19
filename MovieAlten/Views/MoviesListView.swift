//
//  ContentView.swift
//  MovieAlten
//
//  Created by Sergio Muñoz on 19/12/21.
//

import SwiftUI

struct MoviesListView: View {
    @State var moviesList = [MovieData(title: "Movie 1", year: "1996"), MovieData(title: "Harry Potter and the Deathly Hallows: Part 2", year: "2011", poster: "https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg", released: "15 Jul 2011", runtime: "130 min", genre: "Adventure, Fantasy, Mystery", plot: "Harry, Ron, and Hermione search for Voldemort's remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts.")]
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            
            List (moviesList){ movie in
                NavigationLink(destination: MovieDetailView(movie: movie)){
                    MovieRow(movie: movie)

                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Movies")

        }
        
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView(moviesList: [MovieData(title: "Movie 1", year: "1996"), MovieData(title: "Movie 2", year: "2000")])
    }
}
