//
//  ContentView.swift
//  MovieAlten
//
//  Created by Sergio Muñoz on 19/12/21.
//

import SwiftUI

struct MoviesListView: View {
    @EnvironmentObject var viewModel : ViewModel

    enum StateEnum{
        case loading
        case showing
        case error
        case noData
    }
    
    @State var moviesList = [MovieData(title: "Movie 1", year: "1996"), MovieData(title: "Harry Potter and the Deathly Hallows: Part 2", year: "2011", poster: "https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg", released: "15 Jul 2011", runtime: "130 min", genre: "Adventure, Fantasy, Mystery", plot: "Harry, Ron, and Hermione search for Voldemort's remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts.")]
    @State private var searchText = ""
    
    @State var stateView = StateEnum.showing
    
    

    var body: some View {
        NavigationView {
            ZStack{
                switch stateView {
                    case .showing:
                        List (viewModel.movies){ movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.imdbID ?? "")){
                                MovieRow(movie: movie)
                                
                            }
                        }
                    case .noData:
                        Text("no_data")
                    case .error:
                        Text(viewModel.error)
                    case .loading:
                        ProgressView()
                        
                }

            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("movies")
            .onSubmit(of: .search) {
                self.stateView = .loading
                viewModel.getMoviesByTitle(title: searchText){
                    if viewModel.error.isEmpty{
                        if !viewModel.movies.isEmpty {
                            self.stateView = .showing
                        } else {
                            self.stateView = .noData
                        }
                        
                    } else {
                        self.stateView = .error
                    }
                }
            }
        }
        
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView(moviesList: [MovieData(title: "Movie 1", year: "1996"), MovieData(title: "Movie 2", year: "2000")])
    }
}
