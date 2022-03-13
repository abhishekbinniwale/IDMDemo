//
//  APIHandler.swift
//  IDMDemoApp
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 13/03/22.
//

import Foundation


enum APIEnvironment {
    case development
    case staging
    case production
}

enum APIPath {
    case movieList
    case movieImage
}

class APIURL {

    var environment: APIEnvironment
    init(environment: APIEnvironment) {
        self.environment = environment
    }
    func baseURL () -> String {
        return "https://\(subdomain()).\(domain())"
    }

    func imageBaseURL() -> String {
        return "https://image.tmdb.org/t/p/w500"
    }

    func domain() -> String {
        switch environment {
        case .development:
            return "themoviedb.org"
        case .staging:
            return "themoviedb.org"
        case .production:
            return "themoviedb.org"
        }
    }

    func apiKey() -> String {
        switch environment {
        case .development:
            return "38a73d59546aa378980a88b645f487fc"
        case .staging:
            return "38a73d59546aa378980a88b645f487fc"
        case .production:
            return "38a73d59546aa378980a88b645f487fc"
        }
    }


    func subdomain() -> String {
        switch environment {
        case .development, .production, .staging:
            return "api"
        }
    }

    func path(apipath: APIPath) -> String {
        switch apipath {
        case .movieList:
            return self.baseURL()
        case .movieImage:
            return self.imageBaseURL()
        }
    }
}
