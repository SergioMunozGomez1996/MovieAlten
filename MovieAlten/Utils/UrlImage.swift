//
//  UrlImage.swift
//  MovieAlten
//
//  Created by Sergio Muñoz on 20/12/21.
//

import Foundation
import UIKit
//class that download a image from url
class UrlImage: ObservableObject {
    @Published var dataIsLoaded: Bool = false
    @Published var image: UIImage? = nil
    
    
    func loadImage(urlString: String) {
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            
            guard let content = data else {
                print("No data")
                return
            }
            
                                                              
            DispatchQueue.main.async {
                self.image = UIImage(data: content)
                self.dataIsLoaded = true
            }
            print("Data loaded")
            
        }
        task.resume()
    }
}
