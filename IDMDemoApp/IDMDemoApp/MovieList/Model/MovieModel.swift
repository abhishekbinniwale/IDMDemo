//
//  MovieModel.swift
//  IDMDemoApp
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 13/03/22.
//

/*
 {
         "adult": false,
         "backdrop_path": "/5P8SmMzSNYikXpxil6BYzJ16611.jpg",
         "genre_ids": [80, 9648, 53],
         "id": 414906,
         "original_language": "en",
         "original_title": "The Batman",
         "overview": "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",
         "popularity": 3748.264,
         "poster_path": "/74xTEgt7R36Fpooo50r9T25onhq.jpg",
         "release_date": "2022-03-01",
         "title": "The Batman",
         "video": false,
         "vote_average": 8,
         "vote_count": 1582
     }
*/

import Foundation

struct MovieList: Codable {
    let results: [MovieModel]
    let total_pages: Int
    let total_results: Int
    let page: Int
}

struct MovieModel: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    var vote_average: Float
    var vote_count: Int
}
