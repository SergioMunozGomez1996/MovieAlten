//
//  ViewModel.swift
//  MovieAlten
//
//  Created by Sergio Muñoz on 19/12/21.
//

import Foundation
import Alamofire

class ViewModel : ObservableObject {
    @Published var movies = [MovieData]()
    @Published var movie : MovieData?
    @Published var error = ""
    
    private func setError(fail: AFError){
        self.error = "Connection error"
        if let underlyingError = fail.underlyingError {
            if let urlError = underlyingError as? URLError {
                switch urlError.code {
                    case .timedOut:
                        print("Time out error")
                        self.error = "Time out error"
                    case .notConnectedToInternet:
                        print("Not connected to the internet")
                        self.error = "Not connected to the internet"
                    case .badServerResponse:
                        print("Server error")
                        self.error = "Server error"
                    case .networkConnectionLost:
                        print("Network connection lost")
                        self.error = "Network connection lost"
                    default:
                        print("Connection error")
                }
            }
        }
    }
    
    func getMoviesByTitle(title: String, _ completion: @escaping (() -> Void)){
        self.movies.removeAll()
        AF.request("\(Constants.DOMAIN)?s=\(title)&apikey=\(Constants.API_KEY)").responseDecodable(of: MoviesResponse.self){ response in
            
            print("Response: \(response)")
            switch response.result {
            case .success( _):
                self.movies.append(contentsOf: response.value?.search ?? [MovieData]())
            case .failure(let fail):
                self.setError(fail: fail)
            }
            
            completion()
            
        }
    }
    
    func getMovie(id: String, _ completion: @escaping (() -> Void)){
        self.movie = nil
        AF.request("\(Constants.DOMAIN)?i=\(id)&apikey=\(Constants.API_KEY)").responseDecodable(of: MovieData.self){ response in
            
            print("Response: \(response)")
            switch response.result {
            case .success( _):
                self.movie = response.value ?? MovieData()
            case .failure(let fail):
                self.setError(fail: fail)
            }
            
            completion()
            
        }
    }
    
}
