import Foundation
import Alamofire

// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10

class NetworkManagerAlbum: ObservableObject{
    static let shared = NetworkManagerAlbum()
    private init() { }
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    
    let limit: Int = 15

    func fetchAlbum(entity: String, completion: @escaping (Result<[Album], AFError>) -> Void) {
        
        let parameters: [String: Any] = [
            "term": searchTerm,
            "entity": entity,
            "limit": limit,
        ]
        
        AF.request(Auxiliary.NetworkAuxiliary().baseURL, parameters: parameters).validate().responseDecodable(of: AlbumResponse.self) { response in
                switch response.result {
                case .success(let decodedResponse):
                    completion(.success(decodedResponse.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}


