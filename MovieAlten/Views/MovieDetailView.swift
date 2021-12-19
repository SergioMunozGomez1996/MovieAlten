//
//  MovieDetailView.swift
//  MovieAlten
//
//  Created by Sergio Muñoz on 19/12/21.
//

import SwiftUI

struct MovieDetailView: View {
    var movie : MovieData
    
    var body: some View {
        ScrollView(){
            VStack(alignment: .leading){
                HStack (alignment: .top){
                    AsyncImage(url: URL(string: movie.poster ?? "")) { image in
                        image.resizable()
                            .scaledToFit()
                    } placeholder: {
                        Color.red
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text(LocalizedStringKey("title")).font(.title)
                        Text(movie.title ?? "Title")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("released").font(.title)
                        Text(movie.released ?? "Released")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("runtime").font(.title)
                        Text(movie.runtime ?? "Runtime")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("genre").font(.title)
                        Text(movie.genre ?? "Genre")
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }
                }
                
                Text("plot").font(.title)
                Text(movie.plot ?? "")
                
                Text("web").font(.title)
                Text(movie.web ?? "")
                
                Spacer()
            }
            .padding()
        }
        
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: MovieData(title: "Harry Potter and the Deathly Hallows: Part 2", year: "2011", poster: "https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg", released: "15 Jul 2011", runtime: "130 min", genre: "Adventure, Fantasy, Mystery", plot: "Harry, Ron, and Hermione search for Voldemort's remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts.", web: "Harry, Ron, and Hermione search for Voldemort's remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts."))
    }
}
