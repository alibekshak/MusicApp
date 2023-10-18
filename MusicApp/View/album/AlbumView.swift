//
//  AlbumView.swift
//  MusicApp
//
//  Created by Apple on 11.10.2023.
//

import SwiftUI

struct AlbumView: View {
    
    @StateObject var viewModel: AlbumListViewModel
    
    var body: some View {
        List{
            ForEach(viewModel.albums){ album in
                HStack{
                    ImageLoadingView(urlString: album.artworkUrl100, size: 100)
                    
                    VStack(alignment: .leading){
                        Text(album.collectionName)
                        Text(album.artistName)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            switch viewModel.state{
            case .good:
                Color.clear
                    .onAppear{
                        viewModel.loadMore()
                    }
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
            case .loadedAll:
                EmptyView()
            case .error(let error):
                Text("\(error)")
            }
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView(viewModel: AlbumListViewModel())
    }
}
