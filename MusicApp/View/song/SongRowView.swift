//
//  SongRowView.swift
//  MusicApp
//
//  Created by Apple on 30.09.2023.
//

import SwiftUI

struct SongRowView: View {
    
    @Binding var musicResults: [SongResults]
    let rows = Array(repeating: GridItem(.fixed(60), spacing: 0, alignment: .leading), count: 4)
    
    var body: some View {
        LazyVStack{
            Text("Songs")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: rows){
                    ForEach(musicResults, id: \.artistName) { song in
                        HStack{
                            ImageLoadingView(urlString: song.artworkUrl100, size: 60)
                            VStack(alignment: .leading){
                                Text(song.trackName!)
                                Text(song.artistName + " - " + song.collectionName!)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .lineLimit(1)
                        }
                        .frame(width: 280)
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

