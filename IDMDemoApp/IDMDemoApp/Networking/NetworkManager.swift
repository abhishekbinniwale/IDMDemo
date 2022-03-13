//
//  NetworkManager.swift
//  IDMDemoApp
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 13/03/22.
//

//https://api.themoviedb.org/3/movie/now_playing?api_key=38a73d59546aa378980a88b645f487fc&language=en-US&page=1

import Foundation

/// Singleton class
class NetworkManager {

    static let shared = NetworkManager()

    private init() { }

    func getListOfMovies(pageId: Int,language: String,completion: @escaping(MovieList?, Error?)-> ()) {
        let apiUrl = APIURL(environment: .development)
        let apikey = apiUrl.apiKey()
        let movieBaseUrl = apiUrl.baseURL()
        let urlString = "\(movieBaseUrl)/3/movie/now_playing?api_key=\(apikey)&language=\(language)&page=\(pageId)"

        print("urlString:\(urlString)")

        guard let url = URL(string: urlString) else {
            return completion(nil, NetworkError.invalidURL)
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, NetworkError.responseError)
                print("fetching data error:\(error)")
            } else {
                guard let data = data else { return }

                do{
                    let movieList = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(movieList, nil)
                } catch let jsonError {
                    print("Json error:\(jsonError)")
                    completion(nil, NetworkError.responseError)
                }
            }
        }.resume()
    }
}
