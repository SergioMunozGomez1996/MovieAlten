//
//  MovieData.swift
//  MovieAlten
//
//  Created by Sergio Muñoz on 19/12/21.
//

import Foundation
struct MovieData: Identifiable, Decodable {
    let id = UUID()
    var imdbID : String?
    var title : String?
    var year : String?
    var poster : String?
    var released : String?
    var runtime : String?
    var genre : String?
    var plot : String?
    var web : String?
 
    
    enum CodingKeys: String, CodingKey {
        case imdbID = "imdbID"
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case plot = "Plot"
        case web = "Website"
    }
    
//    func getId() -> Int {
//        return id ?? -1
//    }
//
//    mutating func setId(id: Int) {
//        self.id = id
//    }
//
//    func getName() -> String {
//        return name ?? ""
//    }
//
//    mutating func setName(name: String) {
//        self.name = name
//    }
//
//    func getImage() -> Image {
//        return Image() ?? ""
//    }
//
//    mutating func setCode(code: String) {
//        self.code = code
//    }
//
//    func getAmount() -> Int {
//        return amount ?? -1
//    }
//
//    mutating func setAmount(amount: Int) {
//        self.amount = amount
//    }
//
//    func getEnabled() -> Bool {
//        return enabled ?? false
//    }
//
//    mutating func setEnabled(enabled: Bool) {
//        self.enabled = enabled
//    }
//
//    func getTranslation() -> Translation {
//        return translation ?? Translation()
//    }
}
