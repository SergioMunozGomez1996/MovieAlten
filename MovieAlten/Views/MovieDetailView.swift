//
//  MovieDetailView.swift
//  MovieAlten
//
//  Created by Sergio Muñoz on 19/12/21.
//

import SwiftUI

struct MovieDetailView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    
    @State private var isPresented = false
    @State var image : Image?
    
    var movieId : String

    var movie : MovieData?
    
    enum StateEnum{
        case loading
        case showing
        case error
        case noData
    }
    
    @State var stateView = StateEnum.loading

        
    var body: some View {
        ZStack {
            switch stateView {
            case .loading:
                ProgressView()
            case .showing:
                ScrollView(){
                    VStack(alignment: .leading){
                        AsyncImage(url: URL(string:viewModel.movie?.poster ?? "")) { image in
                            image.resizable()
                                .scaledToFit()
                        } placeholder: {
                            Color.red
                        }
                        .onTapGesture {
                            isPresented.toggle()
                        }
                        Spacer().frame(height: 5)
                        
                        Group{
                            Text(LocalizedStringKey("title"))
                                .font(.title2)
                                .bold()
                            Text(viewModel.movie?.title ?? "no_data")
                                .fixedSize(horizontal: false, vertical: true)
                                .contextMenu {
                                    Button(action: {
                                        UIPasteboard.general.string = viewModel.movie?.plot
                                    }) {
                                        Text("copy_to_clipboard")
                                        Image(systemName: "doc.on.doc")
                                    }
                                }
                            Spacer().frame(height: 3)
                        }
                        
                        Group{
                            Text("released")
                                .font(.title2)
                                .bold()
                            Text(viewModel.movie?.released ?? "no_data")
                                .fixedSize(horizontal: false, vertical: true)
                                .contextMenu {
                                    Button(action: {
                                        UIPasteboard.general.string = viewModel.movie?.plot
                                    }) {
                                        Text("copy_to_clipboard")
                                        Image(systemName: "doc.on.doc")
                                    }
                                }
                            Spacer().frame(height: 3)
                        }
                        
                        Group{
                            Text("runtime")
                                .font(.title2)
                                .bold()
                            Text(viewModel.movie?.runtime ?? "no_data")
                                .fixedSize(horizontal: false, vertical: true)
                                .contextMenu {
                                    Button(action: {
                                        UIPasteboard.general.string = viewModel.movie?.plot
                                    }) {
                                        Text("copy_to_clipboard")
                                        Image(systemName: "doc.on.doc")
                                    }
                                }
                            Spacer().frame(height: 3)
                        }
                        
                        Group {
                            Text("genre")
                                .font(.title2)
                                .bold()
                            Text(viewModel.movie?.genre ?? "no_data")
                                .fixedSize(horizontal: false, vertical: true)
                                .contextMenu {
                                    Button(action: {
                                        UIPasteboard.general.string = viewModel.movie?.plot
                                    }) {
                                        Text("copy_to_clipboard")
                                        Image(systemName: "doc.on.doc")
                                    }
                                }
                            Spacer().frame(height: 3)
                        }
                        
                        Group{
                            Text("plot")
                                .font(.title2)
                                .bold()
                            Text(viewModel.movie?.plot ?? "no_data")
                                .fixedSize(horizontal: false, vertical: true)
                                .contextMenu {
                                    Button(action: {
                                        UIPasteboard.general.string = viewModel.movie?.plot
                                    }) {
                                        Text("copy_to_clipboard")
                                        Image(systemName: "doc.on.doc")
                                    }
                                }
                            Spacer().frame(height: 3)
                        }
                        
                        Group{
                            Text("web")
                                .font(.title2)
                                .bold()
                            Text(viewModel.movie?.web ?? "no_data")
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
                                .onTapGesture {
                                    if !(viewModel.movie?.web?.isEmpty ?? true) && viewModel.movie?.web != "N/A"{
                                        actionSheet(url: viewModel.movie?.web ?? "")
                                    } else {
                                        print("cant share")
                                    }
                                }
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .fullScreenCover(isPresented: $isPresented, content: {
                        FullScreenModalView(imageURL: viewModel.movie?.poster ?? "")
                    })
                }
            case .error:
                Text(viewModel.error)
            case .noData:
                Text("no_data")

            }
        }
        .onAppear{
            viewModel.getMovie(id: movieId){
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
    
    func actionSheet(url: String) {
        guard let urlShare = URL(string: url) else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieId: "tt1201607", movie: MovieData(title: "Harry Potter and the Deathly Hallows: Part 2", year: "2011", poster: "https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg", released: "15 Jul 2011", runtime: "130 min", genre: "Adventure, Fantasy, Mystery", plot: "Harry, Ron, and Hermione search for Voldemort's remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts.", web: "Harry, Ron, and Hermione search for Voldemort's remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts."))
    }
}
