//
//  SongView.swift
//  MusicApp
//
//  Created by Apple on 18.10.2023.
//

import SwiftUI

struct SongView: View {
    
    @StateObject var viewModel: SongListViewModel
    
    var body: some View {
        List{
            ForEach(viewModel.songs){ song in
                HStack{
                    ImageLoadingView(urlString: song.artworkUrl60, size: 60)
                    VStack(alignment: .leading){
                        if song.trackName.count > 15{
                            Text(song.trackName.prefix(15) + "...")
                                .font(.headline)
                                .truncationMode(.tail)
                        }else{
                            Text(song.trackName)
                                .font(.headline)
                            
                        }
                        
                        Text(song.artistName)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
            }
            
            switch viewModel.state {
                case .good:
                    Color.clear
                        .onAppear {
                            viewModel.loadMore()
                        }
                case .isLoading:
                    ProgressView("Loading Songs...")
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity)
                case .loadedAll:
                    EmptyView()
                case .error(let error):
                    Text("\(error)")
            }
            
        }
        .listStyle(.grouped)
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(viewModel: SongListViewModel())
    }
}
