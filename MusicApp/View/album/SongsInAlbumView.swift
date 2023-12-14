//
//  SongsInAlbumView.swift
//  MusicApp
//
//  Created by Apple on 13.12.2023.
//

import SwiftUI

struct SongsInAlbumView: View {
    
    @ObservedObject var songsViewModel: SongForAlbumViewModel
    
    var body: some View {
            ScrollView(showsIndicators: false) {
                if songsViewModel.state == .isLoading{
                    ProgressView()
                        .progressViewStyle(.circular)
                } else if songsViewModel.songs.count > 0 {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(songsViewModel.songs) { song in
                            NavigationLink(destination: WebView(urlString: song.previewURL)){
                                HStack(spacing: 10){
                                    Text("\(song.trackNumber)")
                                        .font(.footnote)
                                        .frame(width: 25, alignment: .trailing)
                                        .foregroundColor(.black)
                                    
                                    ImageLoadingView(urlString: song.artworkUrl60, size: 60)
                                    
                                    VStack(alignment: .leading){
                                        Text("\(song.country)")
                                            .font(.footnote)
                                            .foregroundColor(.black)
                                        Text(song.trackName)
                                            .font(.headline)
                                            .truncationMode(.tail)
                                            .foregroundColor(.black)
                                        Text(song.artistName)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .lineLimit(1)
                                }
                                .id(song.trackNumber)
                            }
                            Divider()
                        }
                    }
                }
            }
    }
}

struct SongsInAlbumView_Previews: PreviewProvider {
    static var previews: some View {
        SongsInAlbumView(songsViewModel: SongForAlbumViewModel.example())
    }
}
