//
//  APIService.swift
//  MusicApp
//
//  Created by Apple on 18.10.2023.
//

import Foundation
import Alamofire

enum EntityType: String {
    case album
    case song
}

class APIService {
    
    func fetchAlbums(searchTerm: String, page: Int, limit: Int, completion: @escaping(Result<AlbumResponse, AFError>) -> Void) {
        let url = createURL(for: searchTerm, type: .album, page: page, limit: limit)
        fetch(type: AlbumResponse.self, url: url, completion: completion)
    }
    
    func fetchSongs(searchTerm: String, page: Int, limit: Int, completion: @escaping(Result<SongResponse, AFError>) -> Void) {
        let url = createURL(for: searchTerm, type: .song, page: page, limit: limit)
        fetch(type: SongResponse.self, url: url, completion: completion)
    }
    
    func fetch<T: Decodable>(type: T.Type, url: URL?, completion: @escaping(Result<T, AFError>) -> Void) {
        
        guard let url = url else {
            let error = AFError.invalidURL(url: "Invalid URL")
            completion(Result.failure(error))
            return
        }
        
        AF.request(url).validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let result):
                completion(Result.success(result))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    func createURL(for searchTerm: String, type: EntityType, page: Int?, limit: Int?) -> URL? {
        // https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
        let baseURL = "https://itunes.apple.com/search"
        var queryItems = [URLQueryItem(name: "term", value: searchTerm),
                          URLQueryItem(name: "entity", value: type.rawValue)]
        
        if let page = page, let limit = limit {
            let offset = page * limit
            queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
            queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
        }
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}
