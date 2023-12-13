//
//  SongForAlbumViewModel.swift
//  MusicApp
//
//  Created by Apple on 12.12.2023.
//

import Foundation

class SongForAlbumViewModel: ObservableObject{
    
    let albumID: Int
    
    @Published var songs = [Song]()
    @Published var state: State = .good
    
    private let service = APIService()

    init(albumID: Int){
        self.albumID = albumID
        print("AlbumID - \(albumID)")
    }
    
    func fetch(){
        fetchSongs(for: albumID)
    }
    
    private func fetchSongs(for albumID: Int) {
        service.fetchSongs(for: albumID) {[weak self]  result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let results):
                        
                        var songs = results.results
                        
                        if results.resultCount > 0 {
                            _ = songs.removeFirst()
                        }
                        
                        self?.songs = songs
                        self?.state = .good
                        print("fetched \(results.resultCount) songs for albumID: \(albumID)")
                        
                    case .failure(let error):
                        print("Could not load: \(error)")
                        self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
}
