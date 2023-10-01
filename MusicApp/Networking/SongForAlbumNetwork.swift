import Foundation
import Alamofire


class NetworkManagerSongAlbum{
    static let shared = NetworkManagerSongAlbum()
    private init() { }
    
    let limit: Int = 15

    func fetchSongsAlbum(for term: String, entity: String, completion: @escaping ([SongResults]?) -> Void) {
        let parameters: [String: Any] = [
            "term": term,
            "entity": entity,
            "limit": limit,
//            "albumName": albumName
        ]
        AF.request(Auxiliary.NetworkAuxiliary().baseURL, parameters: parameters).validate().responseJSON{ response in
            switch response.result {
            case .success(let data):
                guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
                    completion(nil)
                    return
                }
                do {
                    let decodedResponse = try JSONDecoder().decode(SongResponse.self, from: jsonData)
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

