//
//  SongListViewModel.swift
//  MusicApp
//
//  Created by Apple on 18.10.2023.
//

import Foundation
import Combine

class SongListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var songs: [Song] = [Song]()
    @Published var state: State = .good
    
    private let service = APIService()
        
    let limit: Int = 20
    var page: Int = 0
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {

        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.clear()
                self?.fetchSong(for: term)
            }.store(in: &subscriptions)
        
    }
    
    func clear() {
       state = .good
       songs = []
        page = 0
    }
    
    func loadMore() {
        fetchSong(for: searchTerm)
    }
    
    func fetchSong(for searchTerm: String){
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == .good else {
            return
        }
        
        state = .isLoading
        
        service.fetchSongs(searchTerm: searchTerm, page: page, limit: limit){ [weak self] response in
            switch response {
            case .success(let result):
                DispatchQueue.main.async {
                    for song in result.results{
                        self?.songs.append(song)
                    }
                    self?.page += 1
                    self?.state = (result.results.count == self?.limit) ? .good : .loadedAll
                    print("fetched \(result.resultCount)")
                }
            case .failure(let error):
                print("Alamofire error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self?.state = .error("Could not get data: \(error.localizedDescription)")
                }
            }
        }
    }
}
