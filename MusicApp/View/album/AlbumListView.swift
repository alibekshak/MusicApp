//
//  AlbumListView.swift
//  MusicApp
//
//  Created by Apple on 28.09.2023.
//

import SwiftUI

struct AlbumListView: View {
    
    @State private var searchTerm: String = ""
    @State private var showButtons: Bool = true
    @State private var imageLoadingStates: [String: Bool] = [:]
    @State private var albumResults: [Album] = []
   
    var body: some View {
        VStack{
            Text("Albums")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            SearchBar(searchTerm: $searchTerm, showButtons: $showButtons, onCommit: searchAlbum)
            
            if searchTerm.count == 0 {
                PlaceholderView(searchTerm: $searchTerm, showButtons: $showButtons, searchMusic: searchAlbum)
                    .frame(maxHeight: .infinity)
            }else{
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(albumResults, id: \.collectionName) { album in
                            VStack {
                                AsyncImage(url: URL(string: album.artworkUrl100))
                                    .frame(width: 100, height: 100)
                                Text(album.artistName!)
                                    .font(.headline)
                                Text(album.collectionName!)
                                    .font(.subheadline)
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
    
    private func searchAlbum() {
        imageLoadingStates.removeAll()
        NetworkManagerAlbum.shared.fetchAlbum(for: searchTerm, entity: "album") { result in
            if let music = result {
                self.albumResults = music
            }
        }
    }

}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
