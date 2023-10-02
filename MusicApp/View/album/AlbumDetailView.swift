//
//  AlbumDetailView.swift
//  MusicApp
//
//  Created by Apple on 02.10.2023.
//

import SwiftUI

struct AlbumDetailView: View {
    
    var album: Album
    
    @State private var musicResults: [SongResults] = []
    @State private var imageLoadingStates: [String: Bool] = [:]
    
    var body: some View {
        HStack{
            ImageLoadingView(urlString: album.artworkUrl100, size: 100)

            VStack(alignment: .leading){
                Text(album.collectionName!)
                Text(album.artistName!)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)

                Text(album.primaryGenreName)
                Text("\(album.trackCount) songs" )
            }
            .lineLimit(1)
            Spacer()
        }
        .padding()
        List{
            ForEach(musicResults, id: \.trackName) { song in
                NavigationLink(destination: WebView(urlString: song.previewUrl ?? "No previewURl")){
                    HStack{
                        ImageLoadingView(urlString: song.artworkUrl60, size: 60)
                        
                        VStack(alignment: .leading){
                            Text(song.trackName ?? "No TrackName")
                                .font(.headline)
                                .truncationMode(.tail)
                            Text(song.artistName + " - " + song.collectionName!)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .lineLimit(1)
                    }
                }
            }
        }
        .listStyle(.plain)
        .onAppear {
            searchMusic()
        }
    }
    
    private func searchMusic() {
        imageLoadingStates.removeAll()
        NetworkManagerSongAlbum.shared.fetchSongs(forAlbumId: String(album.collectionId), entity: "song"){ result in
            if let song = result{
                self.musicResults = song
            }
        }
    }

}


