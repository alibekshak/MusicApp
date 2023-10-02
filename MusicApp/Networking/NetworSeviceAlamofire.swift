import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    let limit: Int = 25

    func fetchMusic(for term: String, entity: String, completion: @escaping (Result<[SongResults], AFError>) -> Void) {
        let parameters: [String: Any] = [
            "term": term,
            "entity": entity,
            "limit": limit,
        ]
        
        AF.request(Auxiliary.NetworkAuxiliary().baseURL, parameters: parameters)
            .validate()
            .responseDecodable(of: SongResponse.self) { response in
                switch response.result {
                case .success(let decodedResponse):
                    completion(.success(decodedResponse.results))
                case .failure(let error):
                    print("Ошибка request: \(error)")
                    completion(.failure(error))
                }
            }
    }
}
