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
    @State private var imageLoadingStates: [String: Bool] = [:]
    @State private var showButtons: Bool = true
    
    var body: some View {
        VStack {
            Text("iTunes Music Search")
                .font(.title)
                .padding()
            
            TextField("Search for music", text: $searchTerm, onCommit: searchMusic)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            
                .padding()
                .background(Color.white)
                
            
            if showButtons{
                
                PlaceholderView(searchTerm: $searchTerm, showButtons: $showButtons, searchMusic: searchMusic)
            }
            
                List(musicResults, id: \.trackName) { music in
                    HStack {
                            AsyncImage(url: URL(string: music.artworkUrl100))
                            .frame(width: 100, height: 100)
                        VStack(alignment: .leading){
                            Text(music.trackName ?? "")
                                .font(.headline)
                            Text(music.artistName)
                                .font(.subheadline)
                        }
                    }
                }
                .listStyle(.plain)
                .onAppear(perform: searchMusic)
        }
        .padding()
    }
    
    private func searchMusic() {
        imageLoadingStates.removeAll()
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
