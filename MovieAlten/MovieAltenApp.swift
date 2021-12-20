//
//  MovieAltenApp.swift
//  MovieAlten
//
//  Created by Sergio Muñoz on 19/12/21.
//

import SwiftUI

@main
struct MovieAltenApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MoviesListView()
                .environmentObject(viewModel)
        }
    }
}
