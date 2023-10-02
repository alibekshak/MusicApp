import Foundation
import Alamofire

//  https://itunes.apple.com/lookup?id=909253&entity=song

class NetworkManagerSongAlbum {
    static let shared = NetworkManagerSongAlbum()
    private init() { }
    

    func fetchSongs(forAlbumId albumId: String, entity: String, completion: @escaping (Result<[SongResults], AFError>) -> Void) {
        let parameters: [String: Any] = [
            "id": albumId,
            "entity": entity,
        ]
        
        AF.request(Auxiliary.NetworkAuxiliaryForSongAlbum().baseURL, parameters: parameters)
            .validate()
            .responseDecodable(of: SongResponse.self) { response in
                switch response.result {
                case .success(let decodedResponse):
                    completion(.success(decodedResponse.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}


