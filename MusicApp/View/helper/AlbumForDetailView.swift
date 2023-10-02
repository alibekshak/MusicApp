//
//  AlbumForDetailView.swift
//  MusicApp
//
//  Created by Apple on 02.10.2023.
//

import SwiftUI

struct AlbumForDetailView: View {
    
    var album: Album
    
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
    }
}

