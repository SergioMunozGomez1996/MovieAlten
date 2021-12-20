//
//  MovieRow.swift
//  MovieAlten
//
//  Created by Sergio Muñoz on 19/12/21.
//

import SwiftUI

struct MovieRow: View {
    var movie : MovieData
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: movie.poster ?? "")) { image in
                image.resizable()
            } placeholder: {
                Color.red
            }
            .frame(width: 50, height: 60).padding(10)
            
            VStack(alignment: .leading) {
                Text(movie.title ?? "Title").font(.title)
                Text(movie.year ?? "Year").font(.title2)
            }
        }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: MovieData(title: "Movie 1", year: "1996"))
    }
}
