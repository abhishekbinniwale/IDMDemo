//
//  MovieListViewModel.swift
//  IDMDemoApp
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 13/03/22.
//

import Foundation

protocol MovieListViewModelDelegate: AnyObject {

    func movieListResult(movies: [MovieModel])

}

class MovieListViewModel {

    weak var delgate: MovieListViewModelDelegate?

    func getMovieList() {
        /// Can handle the pagination here by keeping the current page count
        NetworkManager.shared.getListOfMovies(pageId: 1, language: "en-US") { movieList, error in

            if error != nil {
                print("Error while fetching movies")
            }
            if let movies = movieList?.results {
                self.delgate?.movieListResult(movies: movies)
            }
        }
    }
}
