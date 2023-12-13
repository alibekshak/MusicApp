//
//  AlbumListViewModel.swift
//  MusicApp
//
//  Created by Apple on 11.10.2023.
//

import Foundation
import Alamofire
import Combine

// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10

class AlbumListViewModel: ObservableObject {

    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    @Published var state: State = .good
    
    let limit: Int = 20
    var page: Int = 0
    
    private let service = APIService()
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {

        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.state = .good
                self?.albums = []
                self?.fetchAlbums(for: term)
            }.store(in: &subscriptions)
        
    }
    
    func loadMore() {
        fetchAlbums(for: searchTerm)
    }

    func fetchAlbums(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == State.good else {
            return
        }
        
        state = .isLoading
        
        service.fetchAlbums(searchTerm: searchTerm, page: page, limit: limit) { [weak self] response in
            switch response {
            case .success(let result):
                DispatchQueue.main.async {
                    for album in result.results {
                        self?.albums.append(album)
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

