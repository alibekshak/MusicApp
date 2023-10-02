import Alamofire
import Foundation

// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5

class NetworkManager {
    static let shared = NetworkManager(); private init() { }
    
    let limit: Int = 25

    func fetchMusic(for term: String, entity: String, completion: @escaping ([SongResults]?) -> Void) {
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
