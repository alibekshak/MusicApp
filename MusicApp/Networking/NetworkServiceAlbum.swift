import Foundation
import Alamofire

// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10


class NetworkManagerAlbum {
    static let shared = NetworkManagerAlbum()
    private init() { }
    
    let limit: Int = 15

    func fetchAlbum(for term: String, entity: String, completion: @escaping ([Album]?) -> Void) {
        let parameters: [String: Any] = [
            "term": term,
            "entity": entity,
            "limit": limit,
        ]
        
        AF.request(Auxiliary.NetworkAuxiliary().baseURL, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
                    completion(nil)
                    return
                }
                
                do {
                    let decodedResponse = try JSONDecoder().decode(AlbumResponse.self, from: jsonData)
                    completion(decodedResponse.results)
                } catch {
                    print("Ошибка decode: \(error)")
                    completion(nil)
                }

            case .failure(let error):
                print("Ошибка request: \(error)")
                completion(nil)
            }
        }
    }
}
