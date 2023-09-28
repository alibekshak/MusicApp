//
//  AlbumListView.swift
//  MusicApp
//
//  Created by Apple on 28.09.2023.
//

import SwiftUI

struct AlbumListView: View {
    
    @State private var searchTerm: String = ""
    @State private var musicResults: [AlbumMusic] = []
    
    var body: some View {
        VStack {
            Text("iTunes Music Search")
                .font(.title)
                .padding()
            
            TextField("Search for music", text: $searchTerm, onCommit: searchMusic)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            List(musicResults, id: \.trackName) { music in
                VStack(alignment: .leading) {
                    Text(music.trackName ?? "")
                        .font(.headline)
                    Text(music.artistName)
                        .font(.subheadline)
                }
            }
            .listStyle(.plain)
            .onAppear(perform: searchMusic)
        }
        .padding()
    }
    
    private func searchMusic() {
        NetworkManager.shared.fetchMusic(for: searchTerm) { result in
            if let music = result {
                self.musicResults = music
            }
        }
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
