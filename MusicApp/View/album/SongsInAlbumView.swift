//
//  SongsInAlbumView.swift
//  MusicApp
//
//  Created by Apple on 13.12.2023.
//

import SwiftUI

struct SongsInAlbumView: View {
    
    @ObservedObject var songsViewModel: SongForAlbumViewModel
    
    let selectedSong: Song?
    
    var body: some View {
        ScrollViewReader { proxy in
            
            ScrollView {
                if songsViewModel.state == .isLoading{
                    ProgressView()
                        .progressViewStyle(.circular)
                } else if songsViewModel.songs.count > 0 {
                    VStack(spacing: 10) {
                        ForEach(songsViewModel.songs) { song in
                            HStack{
                                ImageLoadingView(urlString: song.artworkUrl60, size: 60)

                                VStack(alignment: .leading){
                                    Text("\(song.country)")
                                        .font(.footnote)
                                    Text(song.trackName)
                                        .font(.headline)
                                        .truncationMode(.tail)
                                    Text(song.artistName)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .lineLimit(1)
                            }
                        }
                    }
                    .onAppear {
                        if let song = selectedSong {
                            withAnimation {
                                proxy.scrollTo(song.trackNumber, anchor: .center)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SongsInAlbumView_Previews: PreviewProvider {
    static var previews: some View {
        SongsInAlbumView(songsViewModel: SongForAlbumViewModel.example(),
                              selectedSong: nil)
    }
}
