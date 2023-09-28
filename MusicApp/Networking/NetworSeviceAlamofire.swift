import Alamofire
import Foundation
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5

class NetworkManager {
    static let shared = NetworkManager(); private init() { }

    func fetchMusic(for term: String, completion: @escaping ([AlbumMusic]?) -> Void) {
        let parameters: [String: Any] = [
            "term": term,
            "limit": 25
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
