//
//  AlbumListViewModel.swift
//  MusicApp
//
//  Created by Apple on 11.10.2023.
//

import Foundation
import Alamofire

// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10

class AlibumListViewModel: ObservableObject{
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    @Published var entity: String = ""
    @Published var limit: Int = 15
    
    func fetchAlbums(for tern: String, entity: String, completion:  @escaping (Result<[Album], AFError>) -> Void){
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)=\(entity)&limit=\(limit)&offset=10") else { return }
        
        AF.request(url).validate().responseDecodable(of: AlbumResponse.self){ response in
            switch response.result {
            case .success(let decodedResponse):
                completion(.success(decodedResponse.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
