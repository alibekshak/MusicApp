//
//  SongForAlbumViewModel.swift
//  MusicApp
//
//  Created by Apple on 12.12.2023.
//

import Foundation

class SongForAlbumViewModel: ObservableObject{
    
    private let service = APIService()
    
    let albumID: Int
    @Published var songs = [Song]()
    
    init(albumID: Int){
        self.albumID = albumID
    }
    
    func fetchSongs(for albumID: Int){
        
    }
}
