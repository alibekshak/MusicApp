//
//  AlbumView.swift
//  MusicApp
//
//  Created by Apple on 11.10.2023.
//

import SwiftUI

struct AlbumView: View {
    
    @ObservedObject var viewModel: AlbumListViewModel
    
    var body: some View {
        List{
            ForEach(viewModel.albums, id: \.id){ album in
                NavigationLink(destination: AlbumDetailView(album: album)){
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
            }
            
            switch viewModel.state{
            case .good:
                Color.clear
                    .onAppear{
                        viewModel.loadMore()
                    }
            case .isLoading:
                ProgressView("Loading Albums...")
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
                    
            case .loadedAll:
                EmptyView()
            case .noResults:
                Text("Sorry Could not find anything.")
                    .foregroundColor(.gray)
            case .error(let error):
                Text("\(error)")
            }
        }
        .listStyle(.grouped)
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView(viewModel: AlbumListViewModel())
    }
}
