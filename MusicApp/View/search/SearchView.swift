//
//  SearchView.swift
//  MusicApp
//
//  Created by Apple on 29.09.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm: String = ""
    @State private var showButtons: Bool = true
    @State private var imageLoadingStates: [String: Bool] = [:]
    @State private var albumResults: [Album] = []
    @State private var musicResults: [SongResults] = []
    
    var body: some View {
        VStack{
            Text("Search")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            SearchBar(searchTerm: $searchTerm, showButtons: $showButtons, onCommit: performSearch)
            
//            Divider()
            if searchTerm.count == 0{
                PlaceholderView(searchTerm: $searchTerm, showButtons: $showButtons, searchMusic: performSearch)
                    .frame(maxHeight: .infinity)
            }else{
                ScrollView(.vertical){
                    VStack{
                        Text("Songs")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(musicResults, id: \.trackName) { song in
                                    HStack{
                                        ImageLoadingView(urlString: song.artworkUrl100, size: 60)
                                        VStack(alignment: .leading){
                                            Text(song.trackName!)
                                                .lineLimit(2)
                                            Text(song.artistName)
                                                .font(.caption)
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                    .padding()
                    
                    Divider()
                    
                    LazyVStack{
                        Text("Album")
                            .font(.headline)
                        ForEach(albumResults, id: \.collectionName) { album in
                            Text(album.collectionName!)
                        }
                    }
                    
                }
            }
        }
    }
    
    private func performSearch() {
        searchAlbum()
        searchMusic()
    }
    
    private func searchAlbum() {
        imageLoadingStates.removeAll()
        NetworkManagerAlbum.shared.fetchAlbum(for: searchTerm, entity: "album") { result in
            if let music = result {
                self.albumResults = music
            }
        }
    }
    
    private func searchMusic() {
        imageLoadingStates.removeAll()
        NetworkManager.shared.fetchMusic(for: searchTerm, entity: "song") { result in
            if let music = result {
                self.musicResults = music
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
