import Foundation
import Alamofire

//  https://itunes.apple.com/lookup?id=909253&entity=song

class NetworkManagerSongAlbum {
    static let shared = NetworkManagerSongAlbum()
    private init() { }
    

    func fetchSongs(forAlbumId albumId: String, entity: String, completion: @escaping ([SongResults]?) -> Void) {
        let parameters: [String: Any] = [
            "id": albumId,
            "entity": entity,
        ]
        
        AF.request("https://itunes.apple.com/lookup", parameters: parameters).validate().responseJSON { response in
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


