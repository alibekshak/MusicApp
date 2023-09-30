//
//  AlbumRowView.swift
//  MusicApp
//
//  Created by Apple on 30.09.2023.
//

import SwiftUI

struct AlbumRowView: View {
    
    @Binding var albumResults: [Album]
    
    var body: some View {
        LazyVStack(alignment: .leading){
            Text("Album")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            ForEach(albumResults, id: \.collectionName) { album in
                HStack{
                    ImageLoadingView(urlString: album.artworkUrl100, size: 100)
                    
                    VStack(alignment: .leading){
                        Text(album.collectionName!)
                        Text(album.artistName!)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .lineLimit(1)
                }
            }
        }
        .padding()
    }
}

