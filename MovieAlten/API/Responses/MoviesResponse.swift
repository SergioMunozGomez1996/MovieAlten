//
//  MoviesResponse.swift
//  MovieAlten
//
//  Created by Sergio Muñoz on 19/12/21.
//

import Foundation
struct MoviesResponse: Identifiable, Decodable {
    let id = UUID()
    var search : [MovieData]?
    var total : String?
    var response : String?
 
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case total = "totalResults"
        case response = "Response"
    }
}
